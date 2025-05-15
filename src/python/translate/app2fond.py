import argparse
import logging
import os
import coloredlogs

from pddl.logic import Predicate,Constant
from pddl.logic.base import And, OneOf
from pddl import parse_domain
from pddl.core import Domain, Problem, Requirements, Action
from pddl.formatter import domain_to_string, problem_to_string

from pddl_parser import parse_app_problem
from pddl_parser.app_problem import APPProblem

from utils.os_helper import create_folder, split_filename

# setup logger
coloredlogs.install(level='INFO')
logger = logging.getLogger("APP2FOND")


def pddl2fond(domain_file: str, problem_file: str, fond_domain_file: str, fond_problem_file: str, printout=False):
    """
    Translate APP to FOND and save the FOND problem in the output directory
    :param app_file: A pddl file containing agent planning program
    :param output_dir: location to store the FOND problem

    Note: the code inside _get_fond comes from pypddl parser
    """
    output_dir = os.path.dirname(fond_problem_file)
    logger.info(
        f"Translating {problem_file} to FOND encoding into folder {output_dir}.")

    domain: Domain = parse_domain(domain_file)
    problem: APPProblem = parse_app_problem(problem_file)

    # Uncomment if having problem parsing the domain and APP problem
    # print("Domain name:", domain.name)
    # print("Problem name:", problem.name)
    # exit(1)

    # translate to FOND
    fond_domain, fond_problem = _get_fond(domain, problem)

    # # save the files
    with open(fond_domain_file, "w+") as f:
        print(domain_to_string(fond_domain), file=f)

    with open(fond_problem_file, "w+") as f:
        print(problem_to_string(fond_problem), file=f)

    return fond_domain, fond_problem


def _get_fond(app_domain: Domain, app_problem: APPProblem):
    """
    Construct a standard FOND domain+problem following the encoding developed
    by Geffner&Sardina @ UPF'19
    :param domain: A planning domain
    :param problem:  An APP planning problem
    """

    # create a copy before modifying
    # f_domain = deepcopy(app_domain)
    # f_problem = deepcopy(app_problem)

    # f_domain.clean_up()

    # Move all objects in the problem as constants in the domain as
    # they may now be referred in actions due to goals in transitions
    dom_constants = []
    for obj in app_problem.objects:
        dom_constants.append(Constant(obj.name, type_tag=obj.type_tag))
    # print(dom_constants)
    # print(dom_constants[0].type_tags)
    dom_objects = []

    # Remove :action-costs requirements (have extended PDDL to include req key)
    dom_requirements = list(app_domain.requirements)
    # if Requirements.ACTION_COSTS in dom_requirements: # this is not implemented yet in PDDL parser
    #     dom_requirements = dom_requirements.remove(Requirements.ACTION_COSTS)

    # first extract the name of all states in the APP, they will be used a lot
    app_states = []
    for t in app_problem.transitions:
        app_states.append(t.source)
        app_states.append(t.target)
    app_states = list(set(app_states))

    # add fluents q_i and next_q_i, for each node state i in APP
    dom_pred = dict()  # dictionary predicate name to predicate object
    for s in app_states:
        dom_pred[f"q_{s}"] = Predicate(f"q_{s}")
        dom_pred[f"next_q_{s}"] = Predicate(f"next_q_{s}")
    dom_pred['q_init'] = Predicate("q_init")    # add dymmy APP initial state

    # Goal is simply fluent goal_app
    dom_pred['goal_app'] = Predicate("goal_app")

    # Add action t_i_j for each edge (i,goal,j) in APP (also include dymmy first transition to n0)
    #   preconds: q_i, next_q_j, goal
    #   effects: -q_i, -next_q_j, q_j, ONEOF{ {next_q_k : edge(j, k) in APP} U {goal_dummy}}
    dom_trans_actions = []
    app_states = set({})
    app_transitions = list(app_problem.transitions)
    for t in app_transitions:
        t_source = t.source
        t_target = t.target

        f1: Predicate = dom_pred[f"q_{t_source}"]
        f2: Predicate = dom_pred[f"next_q_{t_target}"]
        f3: Predicate = dom_pred[f"q_{t_target}"]

        next_req = set({})
        for t2 in app_problem.transitions:
            if t2.source == t_target:
                next_req.add(dom_pred[f"next_q_{t2.target}"])

        # ensure that oneof is used only when list of effects is more than 1
        if len(next_req) > 0:
            _e = OneOf(dom_pred['goal_app'], *sorted(list(next_req)))
        else:
            _e = dom_pred['goal_app']
            
        a = Action(f"t_{t_source}_{t_target}",
                    parameters=[],
                    precondition=f1 & f2 & t.goal if t.goal != And() else And(f1, f2),
                    effect=And(~f1 & ~f2 & f3, _e))
        dom_trans_actions.append(a)

    # add dummy first action to move from t_init to n0 with all possible requests from n0
    # the new sas translator for prp2 does not like single oneof, we only use one of for more than 1 goal choices
    init_goal_choices = sorted([dom_pred[f"next_q_{t.target}"] for t in app_problem.transitions if t.source == app_problem.init_app])
    if len(init_goal_choices) > 1:
        init_goal = OneOf(*init_goal_choices)
    else:
        init_goal = init_goal_choices[0]

    a = Action(f"t_init",
                    parameters=[],
                    precondition=dom_pred['q_init'],
                    effect=And(~dom_pred['q_init'] & dom_pred[f"q_{app_problem.init_app}"],
                               init_goal))
    dom_trans_actions.append(a)


    dom_requirements.append(Requirements.NON_DETERMINISTIC)
    dom_name = f"FOND-{app_domain.name}--{app_problem.name}"
    domain = Domain(dom_name,
                    requirements=dom_requirements,
                    types=app_domain.types,
                    constants=app_domain.constants.union(dom_constants),
                    predicates=list(app_domain.predicates) + list(dom_pred.values()),
                    actions=list(app_domain.actions) + dom_trans_actions)

    # build FOND problem
    problem = Problem(
        f"FOND-{app_problem.name}",
        domain=domain,
        requirements=dom_requirements,
        objects=[],     # they have all been moved to constants in domain
        init= list(app_problem.init) + [dom_pred['q_init'], dom_pred[f'next_q_{app_problem.init_app}'] ],
        goal=dom_pred['goal_app']
    )

    return domain, problem


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(
        description='Translate APP to FOND problem (domain + problem files)')
    parser.add_argument("domain",
                        nargs="?",
                        help="domain PDDL file.")
    parser.add_argument("problem",
                        help="APP problem file (problem PDDL, domain+problem PDDL, or folder/zip file with APP instance).")
    parser.add_argument('--output_dir',
                        type=str,
                        default='.',
                        help='location to save FOND domain and problem files (Default: %(default)s))')
    parser.add_argument('--print',
                        action='store_true',
                        default=False,
                        help='dump encoding to terminal too (Default: %(default)s)')

    args = parser.parse_args()

    problem_id = split_filename(args.problem)[0]
    create_folder(args.output_dir, delete=False)

    fond_domain_file = os.path.join(
        args.output_dir, f"{problem_id}-domain.pddl")
    fond_problem_file = os.path.join(
        args.output_dir, f"{problem_id}-problem.pddl")

    fond_domain, fond_problem = pddl2fond(os.path.abspath(args.domain), os.path.abspath(
        args.problem), fond_domain_file, fond_problem_file)

    if args.print:
        print(domain_to_string(fond_domain))
        print("="*100)
        print(problem_to_string(fond_problem))
