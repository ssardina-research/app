import os
import re
from timeit import default_timer as timer
from typing import List
from base.ds import APPProblem, SolverType
from base.ds import APPProblem
from base.appsolver import APPSolver
from utils.os_helper import standardize_path
from translate.app2lpg import pddl2lpg


class LPGSolver(APPSolver):
    """ Extends the APPSolver class by providing an implementation for solving agent planning programs using a modified version of LPG planner.
    The FondSolver first translates the given app file to a planning problem and the calls the LPG planner on the translated problem.
    """

    SOLVER_BIN = "pp-lpg"
    BINARIES = ["pp-lpg", "lpg-app"]

    # define files used by pp-lpg
    GRAPH_FILE = "graph.txt"
    INIT_FILE = "init.pddl"
    OBJ_FILE = "obj.pddl"
    GOAL_PREFIX = "G"
    NODE_PREFIX = "n"
    PREDICATE_FILE = "predicates.pddl"
    ACTS_FILE = "acts.pddl"
    INPUT_FILE_NAMES = [OBJ_FILE, INIT_FILE, PREDICATE_FILE, ACTS_FILE, GRAPH_FILE]



    def __init__(self, app_problem: APPProblem) -> None:
        super().__init__(app_problem, SolverType.LPG)
        self.lpg_seed = str(app_problem.extra_info["seed"])
        self.pplpg_bin = str(app_problem.extra_info["pplpg_bin"])
        self.set_logger(f"APP-LPG")

    def _solve_lpg(self):
        self.logger.info(f"Calling LPG on {self.problem.output_dir} with time limit of {self._solve_time_limit()}s.")


        # We used to call the Python high-level interaface in the pp-lpg solver
        # cmd =  [self.SOLVER_BIN, standardize_path(self.problem.output_dir), "--seed", self.lpg_seed]
        # if self.problem.extra_info["leave_tmp"]:
        #     cmd.append("--tmp")

        # We now call the C solver directly
        cmd = [self.pplpg_bin] + self.INPUT_FILE_NAMES + [f"{self.lpg_seed}"]
        self.run(cmd, timeout=self._solve_time_limit())

    def _get_lpg_policy_size(self):
        """Get the sized of a policy by looking at the output of solver and the number of actions in .soln files"""
        output_dir = self.problem.output_dir
        filename = os.path.join(output_dir, "solver.out")
        with open(filename, 'rb') as f:
            if os.path.getsize(filename) > 150:
                f.seek(-150, 2)
            info = f.read().decode("utf-8")

        if "SUCCESS" not in info or "FAILURE" in info:
                return -1   # problem has not been solved

        # we have a plan, it should have a size, extract it!
        # this is the number of classical plans in the policy solution found by pp-lpg
        no_of_plans = re.search(r'Size of policy solution \(as number of plans\): (\d+)', info).group(1)

        soln_files = [_f for _f in os.listdir(output_dir) if _f.endswith(".soln")]
        no_actions_total = 0
        for _f in soln_files:
            with open(os.path.join(output_dir, _f)) as f:
                info = f.readlines()[-1]
                size_of_plan = int(re.search(r'(\d+):', info).group(1))
                no_actions_total += size_of_plan

        return no_of_plans, no_actions_total

    def solve(self) -> None:
        # check if binaries are in the path
        self.check_solver()

        self.write_time_stats("Translation of APP to LPG Time", self.translation_time)
        self.logger.info(f"Translation of APP To LPG Time: {self.translation_time}")

        start = timer()

        # second solve the app problem by using lpg
        self._solve_lpg()

        end = timer()
        self.solve_time = end - start

        no_of_plans, no_of_actions = self._get_lpg_policy_size()
        self.logger.info(f"Found a policy of size (no of plans): {no_of_plans}")
        self.logger.info(f"Found a policy of size (no of actions): {no_of_actions}")

        self.write_time_stats("LPG Solve Time", self.solve_time)
        self.logger.info(f"LPG Solve Time: {self.solve_time}")

    def verify(self) -> None:
        pass

    def translate(self) -> None:
        start = timer()

        # use the pddl2lpg function to translate to PP-LPG task
        pddl2lpg(self.problem.domain, self.problem.problem, self.problem.output_dir)

        end = timer()
        self.translation_time = end - start
        self.logger.info(f"Translation to LPG inputs took {self.translation_time}s.")
