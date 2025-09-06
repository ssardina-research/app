"""
This file contains functions to translate an APP-PDDL Agent Planning Program
problem to input format for the PP-LPG planner as a collection of files:
    obj.pddl init.pddl predicates.pddl act.pddl graph.txt
"""
import os
import logging
import coloredlogs
import argparse
import re
from pddl.core import Domain
from pddl.logic import Predicate
from pddl import parse_domain
from pddl.core import Domain, Action
from pddl.formatter import domain_to_string
from pddl.formatter import print_constants

from pddl_parser.app_problem import APPProblem, Transition
from pddl_parser import parse_app_problem

from utils.os_helper import create_folder

GRAPH_FILE = "graph.txt"
INIT_FILE = "init.pddl"
OBJ_FILE = "obj.pddl"
GOAL_PREFIX = "G"
NODE_PREFIX = "n"
PREDICATE_FILE = "predicates.pddl"
ACTS_FILE = "acts.pddl"

logger = logging.getLogger("APP2LPG")
coloredlogs.install(level='INFO')


def pddl2lpg(domain_file: str, problem_file: str, output_dir: str):
    """ PDDL to PP-LPG translator

    :param domain_file: PDDL domain file
    :param problem_file: APP problem PDDL file
    :param output_dir: Location to save input files for LPG
    """
    logger.info(f"Translating {problem_file} to LPG inputs at {output_dir}.")
    if output_dir is None:
        logger.error("Output directory for translation to PP-LPG format not provided.")
        exit(1)
    create_folder(output_dir, delete=False)

    ########### FIRST THE DOMAIN PART
    domain: Domain = parse_domain(domain_file)
    domain_str = domain_to_string(domain)

    # predicates.pddl:
    #   everything up to actions: domain name, requirements, types, constants, predicates
    #   this is the only part done by regex extraction from txt of domain
    predicates = re.search(r"([.\S\n\t\v ]*?)\)\n^\s*\(:action", domain_str, re.M).group(1)
    with open(os.path.join(output_dir, PREDICATE_FILE), "w+") as f:
        print(predicates, file=f)

    # act.pddlL: all the actions
    #   add dummy-fact to each action's precondition and print all actions
    dummy_fact = Predicate("dummy-fact")
    with open(os.path.join(output_dir, ACTS_FILE), "w+") as f:
        for a in sorted(domain.actions, key=lambda x: x.name):  # sort actions by name so we always get same ordering
            a_new = Action(a.name,
                            parameters=a.parameters,
                            precondition=a.precondition & dummy_fact,
                            effect=a.effect)
            f.writelines(str(a_new))
            f.writelines("\n")

    ########### NOW THE PROBLEM
    problem: APPProblem = parse_app_problem(problem_file)
    problem_str = str(problem)

    # obj.pddl: the head of the APP problem up to the initial state (not included)
    result = f"(define (problem {problem.name})\n"
    result += f"\t(:domain {problem.domain_name})\n"
    if len(problem.requirements) > 0:
        result += "\t(:requirements " + " ".join(sorted(problem.requirements)) + ")\n"
    if len(problem.objects) > 0:
        result += "\t" + print_constants("(:objects", problem.objects, ")\n")
    with open(os.path.join(output_dir, OBJ_FILE), "w+") as f:
            print(result, file=f)

    # init.pddl: the set of facts for the initial state
    with open(os.path.join(output_dir, INIT_FILE), "w+") as f:
        for fact in sorted(problem.init):
            print(fact, file=f)

    # save the graph and goals
    _save_transitions(problem.transitions, output_dir)

    return


def _save_transitions(app_transitions: list[Transition], output_dir: str):
    """Save transitions in a single graph file and possibly multiple goal files
    A transition has the form: '(n1 n2 (:goal (and (on-table b1) (on-table b2)) ))' where:
    - n1 is the source node
    - n2 is the destination node
    - (and (on-table b1) (on-table b2)) is the goal between n1 and n2

    Since we are using pddl parser, we get parsed transitions as a list. An entry in a list is a Transition object.

    :param app_transitions: list of transitions
    :param output_dir: location to store the graph and goal files
    """
    graph_edges = []
    graph_goals = {}

    transitions = list(app_transitions)

    # collect all nodes and map them to integers (pp-lpg only deals with nodes as integers)
    nodes = [n.source for n in app_transitions] + [n.target for n in app_transitions]
    nodes = list(set(nodes))
    nodes.sort()
    try:
        # can we extract a UNIQUE number for ach node string name? for example nodes "n<number>"
        nodes_numbered = [(id, re.search(r'\d+', id).group(0)) for id in nodes]
        if len(set([x[1] for x in nodes_numbered])) != len(nodes):
            raise AttributeError
    except AttributeError:  # can't, so sort and enumerate them
        nodes_numbered = [(id, n) for (n,id) in enumerate(nodes)]
        print("Error: node names must contain a number")
    # maps original node names to integers (to be used in PP-LPG encoding)
    # n0 -_> 0, n1 -> 1, ...
    nodes2id_dict = dict(((id, n) for id,n in nodes_numbered))

    # sort by starting node just to improve readability
    transitions.sort(key=lambda x: f"{x.goal}-{x.target}-{x.source}")


    # we go over the APP transitions and store the information
    # in graph_goals and graph_edges (they will be converted to files later on)
    for i, transition in enumerate(transitions):
        # extract edge goal id (e.g., G1, G2, ...)
        goal_num = f"{GOAL_PREFIX}{i}"

        # store goal information
        graph_goals[goal_num] = f"{transition.goal}\n"

        # store edge information
        edge = f"{nodes2id_dict[transition.source]} {nodes2id_dict[transition.target]} {goal_num}\n"
        graph_edges.append(edge)

    # write each goal file G0, G1, ...
    graph_edges.sort()
    with open(os.path.join(output_dir, GRAPH_FILE), "w+") as f:
        f.writelines(graph_edges)

    # write each goal file G0, G1, ...
    for _f, _goal in graph_goals.items():
        with open(os.path.join(output_dir, _f), "w+") as f:
            f.write(_goal)



if __name__ == "__main__":
    # CLI options
    parser: argparse.ArgumentParser = argparse.ArgumentParser(
        description="Agent planning program PDDL to PP-LPG input translator."
    )
    parser.add_argument("domain",
                        nargs="?",
                        help="domain PDDL file.")
    parser.add_argument("problem",
                        help="APP problem file (problem PDDL, domain+problem PDDL, or folder/zip file with APP instance).")
    parser.add_argument("output_dir",
                        help="Directory where the translated files for PP-LPG should be stored")

    args = parser.parse_args()

    pddl2lpg(args.domain, args.problem, args.output_dir)

