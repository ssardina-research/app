from abc import ABC, abstractmethod
import asyncio
import os
import shutil
import traceback
from typing import List
from base.ds import APPProblem
from base.ds import SolverType
import logging
import coloredlogs
from utils.system_utils import async_run

SOLVER_LOG="solver.out"
RUN_LOG="run.log"
FILE_TIME="time.out"

SOLVER_LEVEL = logging.INFO - 1
"""more detail than debug"""

logging.basicConfig()
logging.addLevelName(SOLVER_LEVEL, "SOLVER")

class APPSolver(ABC):
    """
    Abstract class to represent a solver that solves Agent Planning Programs
    """
    MAX_TIME_LIMIT = 5*24*60*60 # 5 days

    def __init__(self, app_problem: APPProblem, solver_type: SolverType) -> None:
        super().__init__()
        self.show_console_output = not app_problem.extra_info["show_console_output"]
        self.problem = app_problem
        self.solver_type = solver_type
        self.translation_time = 0
        self.solve_time = 0
        self.time_file = open(os.path.join(self.problem.output_dir, "time.out"), 'w')

        # to be instantiated by the child class
        self.logger = None

    def check_solver(self):
        for b in self.BINARIES:
            bin_b = shutil.which(b)
            if shutil.which(b) is not None:
                self.logger.info(f"Found {b} binary at: {bin_b}")
            else:
                self.logger.error(f"{b} not found in path.")
                exit(1)

    def write_time_stats(self, type, time):
        print(f"{type}: {time}", file=self.time_file, flush=True)

    def set_logger(self, logger_name, level='INFO'):
        """Log to 3 handlers: console, solver output (no formatting), and run log (errors+)
        """
        class MyFilter(object):
            """This will restrict to only write out log messages at the level specified."""
            def __init__(self, level):
                self.__level = level

            def filter(self, logRecord):
                return logRecord.levelno <= self.__level

        LOGGER_FMT="%(asctime)s %(hostname)s %(name)s [%(levelname)s] %(message)s"
        LOGGER_TIME_FMT="%Y-%m-%d %H:%M:%S"

        # Create the logger with three handlers: console and file
        self.logger = logging.getLogger(logger_name)
        self.logger.propagate = False

        # First, install console handler with colors if console output is enabled
        if self.show_console_output:
            coloredlogs.install(level=logging.NOTSET, logger=self.logger, fmt=LOGGER_FMT)
        else:
            # just do errors and critical
            coloredlogs.install(level=logging.ERROR, logger=self.logger, fmt=LOGGER_FMT)

        # Second, create a not formatted log for the solver output at one level down of INFO.
        log_file = os.path.join(self.problem.output_dir, SOLVER_LOG)
        logfile_handler = logging.FileHandler(log_file)
        # logfile_handler.setFormatter(logging.Formatter(LOGGER_FMT))
        logfile_handler.addFilter(MyFilter(logging.INFO-1))
        logfile_handler.setLevel(logging.INFO-1)
        self.logger.addHandler(logfile_handler)

        # Third, log everything in run log RUN_LOG
        error_log_file = os.path.join(self.problem.output_dir, RUN_LOG)
        error_logfile_handler = logging.FileHandler(error_log_file)
        error_logfile_handler.setFormatter(logging.Formatter(LOGGER_FMT, datefmt=LOGGER_TIME_FMT))
        error_logfile_handler.setLevel(logging.INFO)
        self.logger.addHandler(error_logfile_handler)

        self.logger.info(f"Logging to file: {log_file}")


    def _solve_time_limit(self):
        """
        Returns the adjusted time after subtracting the translation time from the total time.
        :return: time remaining to solve the fond problem
        """
        time_limit = 0
        if self.problem.time_limit > 0:
            time_limit = max(0, self.problem.time_limit - self.translation_time)
            if time_limit <= 0:
                self.logger.warning(f"Time limit exceeded in translation. Exiting")
                exit(0)
        time_limit = self.MAX_TIME_LIMIT if time_limit == 0 else time_limit
        return int(time_limit)


    def run(self, cmd: List[str], timeout: int):
        cwd = self.problem.output_dir
        logger = self.logger if self.show_console_output else None
        logger = self.logger
        try:
            # result = subprocess.run(cmd, universal_newlines=True, cwd=cwd, timeout=timeout, stdout=out_f)
            # p = subprocess.Popen(cmd, cwd=cwd, universal_newlines=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            self.logger.info(f"Calling app solver {cmd} in the working directory {cwd} with a timeout of {timeout}.")
            asyncio.run(async_run(cmd, cwd, logger, level=SOLVER_LEVEL, timeout=timeout if timeout > 0 else None))

        except asyncio.TimeoutError as e:
            self.logger.error(f"\tTIMEOUT at the experiment script: {self.problem}")
        except KeyboardInterrupt:
            self.logger.error(f'\t Aborting execution of problem {self.problem}')
            raise
        except Exception as e:
            self.logger.error("ERROR - Unrecognized exception (this should not happen): ", e)
            self.logger.error(traceback.format_exc())


    @abstractmethod
    def solve(self) -> None:
        raise NotImplementedError

    @abstractmethod
    def translate(self) -> None:
        raise NotImplementedError

    @abstractmethod
    def verify(self) -> None:
        raise NotImplementedError