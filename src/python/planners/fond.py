import os
from timeit import default_timer as timer
from typing import List
from base.ds import APPProblem, SolverType
from base.ds import APPProblem
from base.appsolver import APPSolver
from enum import Enum, auto
from utils.os_helper import split_filename
from utils.system_utils import clean_args
from translate.app2fond import pddl2fond


class FondPlanner(Enum):
    PRP = auto()
    PR2 = auto()
    PALADINUS = auto()
    FONDSAT = auto()
    CFONDASP = auto()


class FondSolver(APPSolver):
    """Extends the APPSolver class by providing an implementation for solving agent planning programs using a choice of FOND planners.
    Currently, we support these planners
    - PRP, PR2
    - Paladinus
    - FondSat (with either minisat or glucose)
    - Compact FondASP

    The FondSolver first translates the given app file to a fond problem and the calls the chosen fond planner on the translated fond problem.
    """

    SOLVER_PRP = "prp"
    SOLVER_PRP_INV0 = "prp_inv0"
    SOLVER_PR2 = "pr2"
    SOLVER_PR2_INV0 = "pr2_inv0"
    SOLVER_PALADINUS = "paladinus"
    SOLVER_FONDSAT = "fondsat"
    BINARIES = []

    def __init__(self, app_problem: APPProblem) -> None:
        super().__init__(app_problem, SolverType.FOND)
        self.fond_planner: FondPlanner = self.get_planner()
        self.set_logger(f"APP-{self.fond_planner.name}")

        # define FOND encoding domain and problem files
        problem_id = split_filename(self.problem.problem)[0]
        self.fond_domain_file = os.path.join(
            self.problem.output_dir, f"{problem_id}-domain.pddl"
        )
        self.fond_problem_file = os.path.join(
            self.problem.output_dir, f"{problem_id}-problem.pddl"
        )

        match self.fond_planner:
            case FondPlanner.PRP:
                self.BINARIES.append(self.SOLVER_PRP)
            case FondPlanner.PR2:
                self.BINARIES.append(self.SOLVER_PR2)
            case FondPlanner.PALADINUS:
                self.BINARIES.append(self.SOLVER_PALADINUS)
            case FondPlanner.FONDSAT:
                self.BINARIES.append(self.SOLVER_FONDSAT)

    def get_planner(self):
        match self.problem.extra_info["fond_planner"].lower():
            case "prp":
                return FondPlanner.PRP
            case "pr2":
                return FondPlanner.PR2
            case "fondsat":
                return FondPlanner.FONDSAT
            case "paladinus":
                return FondPlanner.PALADINUS
            case "cfondasp":
                return FondPlanner.CFONDASP

    def _get_paladinus_policy_size(self):
        """
        Count the number of "If holds"
        returns -1 if solution not found
        Note: Current this is same as PRP, but may change in the future.
        """
        return self._get_prp_policy_size()

    def _get_prp_policy_size(self):
        """
        Count the number of "If holds"
        returns -1 if solution not found
        """
        output_dir = self.problem.output_dir
        if not os.path.exists(os.path.join(output_dir, "policy.out")):
            return -1

        with open(os.path.join(output_dir, "policy.out")) as f:
            info = f.readlines()

        relevant_lines = [_l for _l in info if "If holds" in _l]
        return len(relevant_lines)

    def _solve_prp(self):
        planner_args = clean_args(self.problem.extra_info["planner_args"])
        self.logger.info(f"Calling PRP with time limit of {self._solve_time_limit()}s.")

        disable_invariant = self.problem.extra_info["disable_invariant"]
        if disable_invariant:
            _solver = self.SOLVER_PRP_INV0
        else:
            _solver = self.SOLVER_PRP

        cmd = [
            _solver,
            self.fond_domain_file,
            self.fond_problem_file,
            "--jic-limit",
            str(self._solve_time_limit()),
            "--dump-policy",
            "2",
        ] + planner_args
        self.run(cmd, timeout=self._solve_time_limit())
        policy_size = self._get_prp_policy_size()
        self.logger.info(f"Found a policy of size: {policy_size}")

    def _solve_pr2(self):
        planner_args = clean_args(self.problem.extra_info["planner_args"])
        self.logger.info(
            f"Calling PR2 with time limit of {self._solve_time_limit()}s."
        )

        disable_invariant = self.problem.extra_info["disable_invariant"]
        if disable_invariant:
            _solver = self.SOLVER_PR2_INV0
        else:
            _solver = self.SOLVER_PR2

        cmd = [
            _solver,
            self.fond_domain_file,
            self.fond_problem_file,
        ] + planner_args
        self.run(cmd, timeout=self._solve_time_limit())
        policy_size = self._get_prp_policy_size()
        self.logger.info(f"Found a policy of size: {policy_size}")

    def _solve_paladinus(self):
        f_policy = os.path.join(self.problem.output_dir, "policy.out")
        planner_args = clean_args(self.problem.extra_info["planner_args"])
        cmd = [
            self.SOLVER_PALADINUS,
            self.fond_domain_file,
            self.fond_problem_file,
            "-timeout",
            str(self._solve_time_limit()),
            "-exportPolicy",
            f_policy,
        ] + planner_args

        self.logger.info(
            f"Calling PALADINUS on with time limit of {self._solve_time_limit()}s."
        )
        self.run(cmd, timeout=self._solve_time_limit())
        policy_size = self._get_prp_policy_size()
        self.logger.info(f"Found a policy of size: {policy_size}")

    def _solve_fondsat(self):
        self.logger.info(
            f"Calling FONDSAT  with time limit of {self._solve_time_limit()}s."
        )
        planner_args = clean_args(self.problem.extra_info["planner_args"])
        cmd = [
            self.SOLVER_FONDSAT,
            self.fond_domain_file,
            self.fond_problem_file,
            "--time-limit",
            f"{self._solve_time_limit()}",
        ] + planner_args
        self.run(cmd, timeout=self._solve_time_limit())

    def _solve_cfondasp(self):
        """
        To solve the fond problem we assume that the translation has created domain.pddl and problem.pddl in the output folder.
        We first need to create a config file for compact fondasp and then pass it to the solver
        """
        pass

    def solve(self) -> None:
        # check if binaries are in the path
        self.check_solver()

        start = timer()

        # solve the fond problem by using the chosen fond planner
        match self.fond_planner:
            case FondPlanner.PRP:
                self._solve_prp()
            case FondPlanner.PR2:
                self._solve_pr2()
            case FondPlanner.PALADINUS:
                self._solve_paladinus()
            case FondPlanner.FONDSAT:
                self._solve_fondsat()
            case FondPlanner.CFONDASP:
                self._solve_cfondasp()

        end = timer()
        self.solve_time = end - start

        self.write_time_stats("FOND Solve Time", self.solve_time)
        self.logger.info(f"FOND Solve Time: {self.solve_time}")

    def verify(self) -> None:
        pass

    def translate(self) -> None:
        start = timer()

        # use the pddl2fond function to translate to FOND task
        pddl2fond(
            self.problem.domain,
            self.problem.problem,
            self.fond_domain_file,
            self.fond_problem_file,
        )

        end = timer()
        self.translation_time = end - start

        # self.logger.info(f"Translation to FOND inputs took {self.translation_time}s.")
        self.logger.info(f"Translation of APP To FOND Time: {self.translation_time}")

        self.write_time_stats("Translation of APP To FOND Time", self.translation_time)
