#!/usr/bin/env python3

from base.ds import APPProblem
from base.ds import SolverType
from base.appsolver import APPSolver
from planners.fond import FondSolver
from utils.os_helper import create_folder, split_filename, standardize_path

import os
import logging
import coloredlogs
import argparse
from timeit import default_timer as timer


SOLVER = SolverType.FOND
PLANNER = None
PLANNER_ARGS = ""
TIMEOUT = 30 * 60  # 30 minutes (in seconds)
OUTPUT_DIR = "./"
QUIET = False
DISABLE_INVARIANT = False
EMPTY_OUTPUT = False
DOMAIN_PATH = None
PROBLEM_PATH = None
DEFAULT_OUT = "fond_out"

# get a logger with the name of the file
LOGGER = logging.getLogger(__name__)
coloredlogs.install(level=logging.DEBUG, logger=LOGGER)


def print_config():
    """
    Print the config of the solver and its inputs.
    """
    LOGGER.info("-------------------------------")
    LOGGER.info(f"Domain: {DOMAIN_PATH}")
    LOGGER.info(f"Problem: {PROBLEM_PATH}")
    LOGGER.info(f"Time limit: {TIMEOUT}")
    LOGGER.info(f"Output dir: {OUTPUT_DIR}")
    LOGGER.info(f"Clear output dir: {EMPTY_OUTPUT}")
    LOGGER.info(f"Planner: {PLANNER}")
    LOGGER.info(f"Planner args: {PLANNER_ARGS}")
    LOGGER.info(f"Quiet: {QUIET}")
    LOGGER.info(f"Disable Invariant Analysis: {DISABLE_INVARIANT}")
    LOGGER.info("-------------------------------")


def set_input():
    """
    Process input
    """
    pass


def set_output():
    """
    Prepare output folder
    """
    global OUTPUT_DIR

    if not OUTPUT_DIR:
        # OUTPUT_DIR = os.path.join(base_path, f"{file_name[0:-5]}-{DEFAULT_OUT}")
        OUTPUT_DIR = f"{split_filename(PROBLEM_PATH)[0]}-{DEFAULT_OUT}"

    # make it absolute to allow solver to always find it independently of the working directory
    OUTPUT_DIR = os.path.abspath(OUTPUT_DIR)

    create_folder(OUTPUT_DIR, delete=EMPTY_OUTPUT)

    return


if __name__ == "__main__":
    # CLI options
    parser: argparse.ArgumentParser = argparse.ArgumentParser(
        description="High-level interface for solving APP problems with FOND planners."
    )
    parser.add_argument("domain", nargs="?", help="domain PDDL file.")
    parser.add_argument("problem", help="APP problem file.")
    parser.add_argument(
        "--mode",
        default="solve",
        help="Functionality of the system to execute %(default)s.",
        choices=["translate", "solve"],
    )
    parser.add_argument(
        "--timeout",
        default=TIMEOUT,
        type=int,
        help="timeout in seconds per run %(default)s",
    )
    parser.add_argument(
        "--planner",
        default="prp",
        help="Which FOND planner to use (optional).",
        choices=["prp", "pr2", "fondsat", "paladinus"],
    )
    parser.add_argument("--output", help="location where output should be stored.")
    parser.add_argument(
        "-e",
        "--empty",
        dest="empty_output",
        action="store_true",
        help="clear output directory %(default)s",
    )    
    parser.add_argument(
        "-q",
        "--quiet",
        dest="quiet",
        action="store_true",
        help="report minimum output %(default)s",
    )
    parser.add_argument(
        "--planner_args",
        type=str,
        default="",
        help="Arguments to pass to the FOND planner.",
    )
    parser.add_argument(
        "--disable_invariant",
        dest="disable_invariant",
        action="store_true",
        help="disable invariant analysis of pre-processor %(default)s",
    )
    args = parser.parse_args()

    # store the passed arguments
    what_to_do = args.mode
    DOMAIN_PATH = standardize_path(args.domain) if args.domain else None
    PROBLEM_PATH = standardize_path(args.problem)
    OUTPUT_DIR = standardize_path(args.output) if args.output else None
    QUIET = args.quiet
    EMPTY_OUTPUT = args.empty_output
    DISABLE_INVARIANT = args.disable_invariant

    TIMEOUT = args.timeout
    PLANNER = args.planner if args.planner is not None else None
    PLANNER_ARGS = args.planner_args
    EXTRA_ARGS = {
        "show_console_output": QUIET,
        "fond_planner": PLANNER,
        "planner_args": PLANNER_ARGS,
        "disable_invariant": DISABLE_INVARIANT,
    }

    start = timer()

    # process input and prepare output folder
    set_input()
    set_output()
    print_config()

    # return the APP problem object
    app_problem = APPProblem(
        domain=DOMAIN_PATH,
        problem=PROBLEM_PATH,
        output_dir=OUTPUT_DIR,
        time_limit=TIMEOUT,
        solver=SOLVER,
        extra_info=EXTRA_ARGS,
    )
    
    LOGGER.info(f"APP problem instance read: {args.problem}.")

    solver: APPSolver = FondSolver(app_problem)

    # NEXT operate on the solver
    if what_to_do == "solve":
        solver.translate()
        solver.solve()
    elif what_to_do == "translate":
        solver.translate()

    end = timer()
    total_time = end - start
    LOGGER.info(f"Time taken (wall): {total_time}.")
