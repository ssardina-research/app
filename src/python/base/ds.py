from dataclasses import dataclass, field
from enum import Enum, auto

class SolverType(Enum):
    LPG = auto()
    GAME = auto()
    FOND = auto()

@dataclass
class APPProblem(object):
    domain: str
    problem: str
    solver: SolverType
    output_dir: str
    time_limit: int
    extra_info: dict = field(default_factory=dict) 

