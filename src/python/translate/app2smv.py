"""
This is a wrapper around pp2nugat
"""

import argparse
import os
import subprocess
import sys
import traceback
import coloredlogs
import logging
import shutil
from utils.os_helper import create_folder, split_filename

BIN_PP2NUGAT = "pp2nugat"


# setup logger
coloredlogs.install(level='INFO')
logger = logging.getLogger("APP2SMV")


def pddl2smv(domain_file: str, problem_file: str, smv_file: str):
    if domain_file is None:
        cmd = f"{BIN_PP2NUGAT} < {problem_file}"
    else:
        cmd = f"cat {domain_file} {problem_file} | {BIN_PP2NUGAT}"

    hanlder_out = sys.stdout
    if smv_file:
        hanlder_out = open(smv_file, "w+")
    try:
        # Send the stderr if any to the file!
        result = subprocess.run(cmd, stdout=hanlder_out, universal_newlines=True, shell=True)
    except Exception as e:
        logger.error("Unrecognized exception while running C-binary pp2nugat: ", e)
        print(traceback.format_exc())
        exit(1)

    return result.returncode




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
    parser.add_argument('--smv_out',
                        type=str,
                        help='file to save the SMV encoding')
    args = parser.parse_args()


    # check pp2nugat C binary is in the PATH
    pp2nugat_path = shutil.which(BIN_PP2NUGAT)
    if pp2nugat_path is None:
        logger.error(f"Executable {BIN_PP2NUGAT} is not found in the PATH. Please install pp2nugat and add it to the PATH.")
        exit(1)
    else:
        logger.info(f"Executable pp2nugat found at: {BIN_PP2NUGAT}")

    pddl2smv(args.domain, args.problem, args.smv_out)
