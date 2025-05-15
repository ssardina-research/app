from benchexec.tools.template import BaseTool2
import benchexec.result as result


class Tool(BaseTool2):

    def __init__(self) -> None:
        super().__init__()
        self._output_dir = None

    def executable(self, tool_locator):
        return tool_locator.find_executable("pp-lpg.py")

    def name(self):
        return "PP-LPG"

    def program_files(self, executable):
        return self._program_files_from_executable(
            executable, self.REQUIRED_PATHS, parent_dir=True
        )

    def cmdline(self, executable, options, task, rlimits):
        for i in range(len(options)):
            option = options[i]
            if option == "--output_prefix":
                options[i] = "--output"
                self._output_dir = options[i + 1] + task.options["output"]
                options[i + 1] = self._output_dir
                break

        options += ["--timeout", str(rlimits.cputime)]

        return [executable] + options + list(task.input_files)

    def determine_result(self, run):
        """
        @return: status of the solver output
        """

        status = result.RESULT_FALSE_PROP

        for line in run.output:
            if "SUCCESS!" in line:
                status = result.RESULT_TRUE_PROP

        if not status:
            status = result.RESULT_ERROR
        return status

    def get_value_from_output(self, output, identifier):
        """
        Count the number of "If holds"
        returns -1 if solution not found
        """
        if identifier.lower() == "policysize":
            return self._get_policy_size(output)
        elif identifier.lower() == "solvetime":
            solve_time = self._get_solve_time(output)
            return solve_time
        elif identifier.lower() == "translationtime":
            translation_time = self._get_translation_time(output)
            return translation_time

    def _get_solve_time(self, output):
        solve_time = -1
        for _l in output:
            if "LPG Solve Time" in _l:
                solve_time = _l.split(":")[-1].strip()
                break

        return solve_time

    def _get_translation_time(self, output):
        translation_time = -1
        for _l in output:
            if "Translation of APP To LPG Time:" in _l:
                translation_time = _l.split(":")[-1].strip()
                break

        return translation_time

    def _get_policy_size(self, output):
        """
        Found a policy of size (no of actions): 4966
        """
        for _l in output:
            if "Found a policy of size (no of actions)" in _l:
                return _l.split(":")[-1].strip()
