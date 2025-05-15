import logging
import importlib.util
import subprocess
from typing import List
from cpuinfo import get_cpu_info
import platform
import psutil
import asyncio
import async_timeout
from asyncio.subprocess import Process


def check_pkg_installed(pkg_name: str):
    return importlib.util.find_spec(pkg_name) is not None


def clean_args(args: str):
    args_str = args.split()
    args_list = [_p.replace("'", "").replace('"', "") for _p in args_str]
    return args_list


def print_system_info():
    print(
        "------------------------------------------------------------------------------"
    )
    cpu_info = get_cpu_info()
    print(f"CPU Vendor: {cpu_info['vendor_id_raw']}")
    print(f"CPU: {cpu_info['brand_raw']}")
    print(f"CPU Speed Actual: {cpu_info['hz_actual_friendly']}")
    print(f"CPU Speed Advertised: {cpu_info['hz_advertised_friendly']}")
    print(f"Platform: {platform.system()}")
    print(f"Platform version: {platform.version()}")
    print(f"Platform release: {platform.release()}")
    print(f"Memory: {str(round(psutil.virtual_memory().total / (1024.0 **3)))} GB")
    print(
        "------------------------------------------------------------------------------"
    )


def execute_shell(cmd: str, cwd_dir: str, output_file: str):
    """
    Execute the given program with its arguments
    :param executable: path to program
    :param output_dir: path where clingo will be run
    :param output_file: path to the output file
    :return: If a solution is found, If the process timed out
    """
    try:
        process = subprocess.Popen(
            cmd,
            cwd=cwd_dir,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            start_new_session=True,
            shell=True,
        )
        stdout, stderr = process.communicate()

        # save output
        with open(output_file, "w") as f:
            f.write(stdout.decode())

    except Exception as e:
        print(f"ERROR while executing {cmd}.")
        print(e)


def execute(executable: str, args: List[str], cwd_dir: str, output_file: str):
    """
    Execute the given program with its arguments
    :param executable: path to program
    :param args: arguments to cmd
    :param output_dir: path where clingo will be run
    :param output_file: path to the output file
    :return: If a solution is found, If the process timed out
    """
    executable_list = [executable] + args
    try:
        process = subprocess.Popen(
            executable_list,
            cwd=cwd_dir,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            start_new_session=True,
        )
        stdout, stderr = process.communicate()

        # save output
        with open(output_file, "w") as f:
            f.write(stdout.decode())

    except Exception as e:
        print(f"ERROR while executing {executable}.")
        print(e)


async def async_run(cmd, cwd, logger, level=logging.INFO, timeout=None):
    async with async_timeout.timeout(timeout):
        await async_run_aux(cmd, cwd, logger, level)


async def async_run_aux(cmd, cwd, logger: logging.Logger, level=logging.INFO):
    """Runs command in a subprocess and writes output to a file and a logger"""
    proc = await asyncio.create_subprocess_exec(
        *cmd, cwd=cwd, stdout=asyncio.subprocess.PIPE, stderr=asyncio.subprocess.PIPE
    )

    while True:
        data = await proc.stdout.readline()
        line = data.decode("ascii")
        # error = await proc.stderr.readline()
        if not line:
            break
        else:
            if logger:
                logger.log(level, line.rstrip())
        # Wait for the subprocess exit.

    await proc.wait()


async def async_run_quiet(cmd, cwd, out_file):
    proc = await asyncio.create_subprocess_shell(
        " ".join(cmd),
        cwd=cwd,
        stdout=asyncio.subprocess.PIPE,
        stderr=asyncio.subprocess.PIPE,
    )
    # Wait for the subprocess to finish
    stdout, stderr = await proc.communicate()

    # Read one line of output.
    with open(out_file, "w+") as f:
        f.writelines(stdout.decode())


if __name__ == "__main__":
    print_system_info()
