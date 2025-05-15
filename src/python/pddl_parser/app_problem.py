from ctypes import cast
from textwrap import indent
from typing import AbstractSet, Collection, Optional
from pddl.core import Domain, Problem, Requirements
from pddl.custom_types import namelike
from pddl.formatter import (
    print_constants,
    remove_empty_lines,
    sort_and_print_collection,
)
from pddl.helpers.base import ensure, ensure_set
from pddl.logic.base import Formula, And
from pddl.logic.terms import Constant
from pddl.custom_types import name as name_type


class APPProblem(Problem):
    def __init__(
        self,
        name: namelike,
        domain: Optional[Domain] = None,
        domain_name: Optional[str] = None,
        requirements: Optional[Collection["Requirements"]] = None,
        objects: Optional[Collection["Constant"]] = None,
        init: Optional[Collection[Formula]] = None,
        init_app: Optional[str] = None,
        transitions: Optional[Collection["Transition"]] = None,
    ):
        """
        Initialize the PDDL problem.

        :param name: the name of the PDDL problem.
        :param domain: the PDDL domain.
        :param domain_name: the domain name. Must match with the domain object.
        :param requirements: the set of PDDL requirements.
        :param objects: the set of objects.
        :param init: the initial condition.
        :param init_app: the start node
        :param transitions: transitions for the agent planning problem
        """
        planning_goal = None
        metric = None
        # call the init for Problem
        super().__init__(
            name,
            domain,
            domain_name,
            requirements,
            objects,
            init,
            planning_goal,
            metric,
        )
        self._transitions = ensure_set(transitions)
        self._init_app = name_type(init_app)

    @property
    def init_app(self) -> str:
        """Get the initial node."""
        return self._init_app

    @property
    def transitions(self) -> AbstractSet["Transition"]:
        """Get the Transitions."""
        return self._transitions

    def __eq__(self, other):
        """Compare with another object."""
        return (
            isinstance(other, APPProblem)
            and self.name == other.name
            and self._domain == other._domain
            and self.domain_name == other.domain_name
            and self.requirements == other.requirements
            and self.objects == other.objects
            and self.init == other.init
            # and self.goal == other.goal
            # and self.metric == other.metric
            and self.init_app == other.init_app
            and self.transitions == other.transitions
        )

    def __str__(self) -> str:
        """Get the string representation."""
        result = f"(define (planprog {self.name})"
        body = f"(:domain {self.domain_name})\n"
        indentation = " " * 4
        body += _sort_and_print_collection("(:requirements ", self.requirements, ")\n")
        if self.objects:
            body += _print_constants("(:objects", self.objects, ")\n")
        body += _sort_and_print_collection("(:init ", self.init, ")\n", is_mandatory=True)
        body += f"{'(:metric ' + str(self.metric) + ')'}\n" if self.metric else ""

        body += f"{'(:init-app ' + self.init_app + ')'}\n"

        body += _sort_and_print_collection(
            "(:transitions \n ", self.transitions, ")\n", is_mandatory=True
        )

        result = result + "\n" + indent(body, indentation) + "\n)"
        result = _remove_empty_lines(result)
        return result

class Transition:
    def __init__(
        self,
        source: namelike,
        target: namelike,
        goal: Optional[Formula] = None,
    ):
        """
        Initialize the action.

        :param name: the action name.
        :param parameters: the action parameters.
        :param precondition: the action precondition.
        :param effect: the action effect.
        """
        self._source: str = name_type(source)
        self._goal: Formula = ensure(goal, And())
        self._target: str = name_type(target)

    @property
    def goal(self) -> Formula:
        """Get the goal."""
        return self._goal

    @property
    def source(self) -> str:
        """Get the source node."""
        return self._source

    @property
    def target(self) -> str:
        """Get the target node."""
        return self._target

    def __str__(self) -> str:
        """Get the string representation."""
        return f"({str(self.source)} {str(self.target)} (:goal {str(self.goal)}))\n"

