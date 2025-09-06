#!/usr/bin/env python3

import shutil
from planners.lpg import LPGSolver
from base.ds import APPProblem
from base.ds import SolverType
from base.appsolver import APPSolver
from translate.app2lpg import GRAPH_FILE, INIT_FILE, OBJ_FILE, ACTS_FILE, PREDICATE_FILE
from utils.os_helper import (
    PathType,
    create_folder,
    extract_zip,
    split_filename,
    standardize_path,
)

import os
import logging
import coloredlogs
import argparse
from timeit import default_timer as timer


SOLVER = SolverType.LPG
SEED = 8888
SOLVER_BIN = "pp-lpg"
SOLVER_BINS = ["pp-lpg", "pp-lpg-small", "pp-lpg-nopref", "pp-lpg-adapt"]
TIMEOUT = 30 * 60  # 30 minutes
OUTPUT_DIR = None
QUIET = False
DOMAIN_PATH = None
PROBLEM_PATH = None
INPUT_TYPE = None
INPUT_FILE_NAMES = [GRAPH_FILE, INIT_FILE, OBJ_FILE, ACTS_FILE, PREDICATE_FILE]
DEFAULT_OUT = "lpg_out"
LEAVE_TEMP = False


# get a logger with the name of the file
LOGGER = logging.getLogger(__name__)
coloredlogs.install(level=logging.DEBUG, logger=LOGGER)


def check_input_files():
    for file in INPUT_FILE_NAMES:
        if not os.path.exists(os.path.join(OUTPUT_DIR, file)):
            LOGGER.error(f"Input file {file} missing in folder {OUTPUT_DIR}.")
            exit(1)


def print_config():
    """
    Print the config of the solver and its inputs.
    """
    LOGGER.info("-------------------------------")
    LOGGER.info(f"Domain: {DOMAIN_PATH}")
    LOGGER.info(f"Problem: {PROBLEM_PATH}")
    LOGGER.info(f"PP-LPG binary: {SOLVER_BIN}")
    LOGGER.info(f"Seed: {SEED}")
    LOGGER.info(f"Time limit: {TIMEOUT}")
    LOGGER.info(f"Output dir: {OUTPUT_DIR}")
    LOGGER.info(f"Input Type: {INPUT_TYPE}")
    LOGGER.info(f"Leave temp: {LEAVE_TEMP}")
    LOGGER.info(f"Quiet: {QUIET}")
    LOGGER.info("-------------------------------")


def set_input():
    # deal with different input types
    global INPUT_TYPE

    if DOMAIN_PATH is not None or PROBLEM_PATH.endswith(
        ".pddl"
    ):  # domain and problem PDDL files
        INPUT_TYPE = PathType.PDDL
    elif PROBLEM_PATH.endswith(".zip"):  # a zip file.
        INPUT_TYPE = PathType.ZIP
    elif os.path.isdir(PROBLEM_PATH):  # a directory.
        INPUT_TYPE = PathType.DIR
    else:  # we don't know what to do.
        LOGGER.error("Invalid input type. Please used a PDDL, ZIP, or a DIR.")
        exit(1)


def set_output(output_dir: str = None):
    """
    Takes relevant actions to prepare the output paths for LPG planner.
    In case of ZIP input and DIR input we also check if the required files exist.
    """
    if output_dir is None:
        LOGGER.error("No output folder specified")
        exit(1)

    # make it absolute to allow solver to always find it independently of the working directory
    output_dir = os.path.abspath(output_dir)
    create_folder(output_dir, delete=True)

    match INPUT_TYPE:
        case PathType.PDDL:
            pass

        case PathType.ZIP:  # We will need to extract it in the output folder.
            try:
                extract_zip(PROBLEM_PATH, output_dir)
                LOGGER.info(f"Extracted {PROBLEM_PATH} at {output_dir}.")

                check_input_files()
            except Exception as e:
                LOGGER.error(e)
                LOGGER.error(f"Error in extracting the zip file {input}.")
                exit(1)

        case (
            PathType.DIR
        ):  # We will need to check all inputs are there in the input folder.
            try:
                shutil.copytree(PROBLEM_PATH, output_dir, dirs_exist_ok=True)
            except Exception as e:
                LOGGER.error(e)
                LOGGER.error(
                    f"Error in copying the directory {PROBLEM_PATH} to {output_dir}."
                )
                exit(1)

            check_input_files()


if __name__ == "__main__":
    # set logger

    # CLI options
    parser: argparse.ArgumentParser = argparse.ArgumentParser(
        description="High-level interface for solving and experimenting with APP problems using LPG."
    )
    parser.add_argument("domain", nargs="?", help="domain PDDL file.")
    parser.add_argument(
        "problem",
        help="APP problem file (problem PDDL, or folder/zip file with APP instance).",
    )
    parser.add_argument(
        "--mode",
        default="solve",
        help="Functionality of the system to execute (Default: %(default)s).",
        choices=["translate", "solve"],
    )
    parser.add_argument(
        "--timeout",
        default=TIMEOUT,
        type=int,
        help="timeout in seconds per run (Default: %(default)s)",
    )
    parser.add_argument(
        "--seed",
        default=SEED,
        type=int,
        help="seed to use for LPG planner (Default: %(default)s).",
    )
    parser.add_argument(
        "--solver",
        default=SOLVER_BIN,
        choices=SOLVER_BINS,
        type=str,
        help="PP-LPG solver version to use (Default: %(default)s).",
    )
    parser.add_argument("--output", help="location where output should be stored.")
    parser.add_argument(
        "-q",
        "--quiet",
        dest="quiet",
        action="store_true",
        help="report minimum output (Default: %(default)s)",
    )
    args = parser.parse_args()

    # store the passed arguments
    what_to_do = args.mode
    DOMAIN_PATH = standardize_path(args.domain) if args.domain else None
    PROBLEM_PATH = standardize_path(args.problem)
    OUTPUT_DIR = (
        standardize_path(args.output)
        if args.output
        else f"{split_filename(PROBLEM_PATH)[0]}-{DEFAULT_OUT}"
    )
    QUIET = args.quiet

    SEED = args.seed
    SOLVER_BIN = args.solver
    TIMEOUT = args.timeout
    EXTRA_ARGS = {"seed": SEED, "pplpg_bin": SOLVER_BIN, "show_console_output": QUIET}

    start = timer()

    # process input and prepare output folder
    set_input()
    set_output(OUTPUT_DIR)
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

    solver: APPSolver = LPGSolver(app_problem)

    # NEXT operate on the solver
    if what_to_do == "solve":
        if INPUT_TYPE == PathType.PDDL:
            solver.translate()
        solver.solve()
    elif what_to_do == "translate" and INPUT_TYPE == PathType.PDDL:
        solver.translate()

    end = timer()
    total_time = end - start
    LOGGER.info(f"Time taken: {total_time}.")
