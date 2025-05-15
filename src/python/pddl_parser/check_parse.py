#
# Copyright 2021-2023 WhiteMech
#
# ------------------------------
#
# This file is part of pddl.
#
# Use of this source code is governed by an MIT-style
# license that can be found in the LICENSE file or at
# https://opensource.org/licenses/MIT.
#

"""Tool to check parsing of PDDL files."""
import os
import sys

import click

from pddl import parse_domain, parse_problem
from pddl.formatter import domain_to_string, problem_to_string
from pddl_parser import parse_app_problem

@click.group()
def cli():
    """The unquestionable parser for PDDL 3.1."""  # noqa


quiet_option = click.option("-q", "--quiet", is_flag=True, help="Don't print anything.")


@cli.command()
@click.argument("domain_file", type=click.Path(exists=True, dir_okay=False))
@quiet_option
def domain(app_file, quiet):
    """Check a PDDL domain file is correct."""
    if quiet:
        sys.stdout = open(os.devnull, "a")
    print(domain_to_string(parse_domain(app_file)))


@cli.command()
@click.argument("problem_file", type=click.Path(exists=True, dir_okay=False))
@quiet_option
def problem(problem_file, quiet):
    """Check a PDDL problem file is correct."""
    if quiet:
        sys.stdout = open(os.devnull, "a")
    print(problem_to_string(parse_problem(problem_file)))

@cli.command()
@click.argument("app_file", type=click.Path(exists=True, dir_okay=False))
@quiet_option
def app(app_file, quiet):
    """Check a PDDL APP problem file is correct."""
    if quiet:
        sys.stdout = open(os.devnull, "a")
    print(str(parse_app_problem(app_file)))


if __name__ == "__main__":
    cli()
