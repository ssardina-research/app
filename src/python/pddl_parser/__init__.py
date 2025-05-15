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

"""Top-level package for extending pddl parser to APP."""
from pddl_parser.app_problem import APPProblem


def parse_app_problem(fn) -> APPProblem:
    from pddl_parser.parser.app_eval import APPParser

    with open(fn, "r") as f:
        ptext = f.read()
    return APPParser()(ptext)