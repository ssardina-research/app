#!/usr/bin/env python3

import argparse

from pddl import parse_domain
from pddl.core import Domain
from pddl.formatter import domain_to_string
from pddl_parser.app_problem import APPProblem
from pddl_parser import parse_app_problem

if __name__ == "__main__":
    parser: argparse.ArgumentParser = argparse.ArgumentParser(
        description="Read and re-write planning domain"
    )
    parser.add_argument("domain", help="domain PDDL file.")
    parser.add_argument("problem", nargs="?", help="problem PDDL file.")
    args = parser.parse_args()

    domain: Domain = parse_domain(args.domain)
    print(domain_to_string(domain))

    if args.problem:
        problem: APPProblem = parse_app_problem(args.problem)

        print("=" * 100)
        print(problem)
