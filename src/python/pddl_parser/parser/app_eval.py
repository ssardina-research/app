# Parser for Agent Planning Programs, based on pddl
#
# This file is part of app-pddl.
#
# Use of this source code is governed by an MIT-style
# license that can be found in the LICENSE file or at
# https://opensource.org/licenses/MIT.
#

"""Implementation of the PDDL domain parser."""
from typing import Any, Dict

import sys
import os
from lark import Lark

from pddl_parser.app_problem import APPProblem, Transition
from pddl.parser.problem import ProblemTransformer
from pddl.parser.domain import DomainTransformer
from lark.visitors import Transformer, merge_transformers
from pddl.helpers.base import assert_

# our APP grammar relies on pddl grammars so we need to set the import dir to point to pddl package
from pddl.parser import PARSERS_DIRECTORY as PARSERS_IMPORT_DIRECTORY

# set the folder where app.lark is located (the other .lark files are the pddl project)
from pathlib import Path
APP_GRAMMAR_FILE = Path(os.path.dirname(Path(__file__).absolute())) / "app.lark"

class APPTransformer(Transformer):
# class APPTransformer(ProblemTransformer):
    """Agent planning problem Transformer.

    This is used by the parser (function call_parser in pddl/helpers/base.py) to transform a parsing Tree (representing the text as per the grammar) into an APPProblem object.
    """

    # def __init__(self):
    #     """Initialize the domain and problem transformers."""
    #     super().__init__()

    def start(self, children):
        return children[0]

    def app(self, children):
        children = [arg for arg in children if arg is not None]
        assert_(
            (children[0].value + children[1].value + children[-1].value == "(define)"),
            "Problem should start with '(define' and close with ')'",
        )
        return APPProblem(**dict(children[2:-1]))

    def source(self, children):
        """ Process transition source rule """
        return "source", children[0]

    def target(self, children):
        """ Process transition target rule """
        return "target", children[0]

    def transitions(self, children):
        """Process the 'transitions' rule."""
        return "transitions", children[2:-1]

    def transition(self, children):
        # need to yield:
        #   [Token('LPAR', '('), ('source', Token('NAME', 'n49')), ('target', Token('NAME', 'n0')), ('goal', Predicate(contains, shot1, cocktail2)), Token('RPAR', ')')]
        source = children[1][1]
        target = children[2][1]
        goal = children[3][1]
        return Transition(source=source, target=target, goal=goal)

    def init_app(self, children):
        """Process the 'init-app' rule."""
        return "init_app", children[2]

    def app_problem_def(self, children):
        """Process the 'app_problem_def' rule."""
        return "name", children[2]

_parser_lark = APP_GRAMMAR_FILE.read_text()

class APPParser:
    """APP PDDL domain parser class."""

    def __init__(self):
        """Initialize."""
        # this will import all functions F in ProblemTransformer into APPTransformer as problem__F
        # it is then important that the Lark grammar uses problem__F (rather than just F!)
        self._transformer = merge_transformers(APPTransformer(), problem=ProblemTransformer())

        # build the parser to be used; IMPORT from main pddl project
        self._parser = Lark(
            _parser_lark, parser="lalr", import_paths=[PARSERS_IMPORT_DIRECTORY]
        )
        # self._parser = Lark(
        #     _parser_lark, parser="earley", import_paths=[PARSERS_IMPORT_DIRECTORY]
        # )


    def __call__(self, text):
        """Call the object as a function
        Will return the object representing the parsed text/file which is an object 
        of class pddl_parser.app_problem.APPProblem

        The call_parser() function is part of pddl package: will build a Tree from text and then an object pddl_parser.app_problem.APPProblem from the Tree
        """
        # this is OK when pddl.helpers.base provides call_parser API, but that is not in pip package 0.4.0 so we implement directly what is in that function
        # https://github.com/AI-Planning/pddl/blob/4ee8d63034a668072dd0656be1fe59d2f00804f8/pddl/helpers/base.py#L203
        # return call_parser(text, self._parser, self._transformer)

        # this was actually the code in call_parser() function
        sys.tracebacklimit = 0  # noqa
        tree = self._parser.parse(text)
        sys.tracebacklimit = None  # noqa
        formula = self._transformer.transform(tree)
        return formula



if __name__ == "__main__":
    file = sys.argv[1]
    with open(file, "r") as f:
        ptext = f.read()
    app = APPParser()(ptext)
    print(app)