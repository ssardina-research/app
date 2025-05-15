# Experiments and Benchmarking

The folder [bechmkarks](benchmarks/) includes APP problem instances and configuration files to run experiments and benchmark different solvers.

Two experimental frameworks are included.

- [Experiments and Benchmarking](#experiments-and-benchmarking)
  - [Benchexec Framework](#benchexec-framework)
    - [Installation and setup](#installation-and-setup)
    - [Configuring an experiment benchmark: Tools + Tasks](#configuring-an-experiment-benchmark-tools--tasks)
    - [Running a benchmark](#running-a-benchmark)
    - [Output of Benchexec](#output-of-benchexec)
    - [Runexec tool: single benchexec runs](#runexec-tool-single-benchexec-runs)
    - [Problems](#problems)
      - [Unsupported tool "benchexe.tool\_fond" specified. ImportError: No module named 'benchexe'](#unsupported-tool-benchexetool_fond-specified-importerror-no-module-named-benchexe)
    - [ModuleNotFoundError: No module named 'XXXXXX' (BenchExec log files)](#modulenotfounderror-no-module-named-xxxxxx-benchexec-log-files)



## Benchexec Framework

[Benchexec](https://github.com/sosy-lab/benchexec) is a benchmarking framework that is able to reliably measure and limit resource usage of the benchmarked tool even if the latter spawns sub-processes. It also includes a program called [runexec](https://github.com/sosy-lab/benchexec/blob/main/doc/runexec.md) that _"can be used to easily execute a single command while measuring its resource consumption, similarly to the tool time but with more reliable time measurements and with measurement of memory usage"_.

### Installation and setup

Details on its installation and its working can be found [here](https://github.com/sosy-lab/benchexec/blob/main/doc/INSTALL.md). Please note that Benchexec works better with Linux kernel 6.1+.

The instructions for Ubuntu-based system is to install Benchexec from its [PPA](https://launchpad.net/~sosy-lab/+archive/ubuntu/benchmarking):

```shell
$ sudo add-apt-repository ppa:sosy-lab/benchmarking
$ sudo apt update
$ sudo apt install Benchexec
$ sudo apt install python3-pystemd  # for Benchexec to set-up cgroups automatically
```

The problem with this is that one would also need to have installed all other Python modules required to run the various solvers, like `python3-cpuinfo` or `async-timeout`. Unfortunately, not every used model is available as an Ubuntu package, such as `pddl`.

So, the best approach is to create a Python virtual environment which contains Benchexec and all other requirements, and run the experiments within that environment:

```shell
$ python -m venv ~/my_virtualenv/app
$ source ~/virtualenv/app/bin/activate
$ pip install -r requirements.txt   # this will install Benchexec and all necessary

$ which benchexec
/home/ssardina/virtualenv/app/bin/benchexec
```

Note the `benchexec\[systemd\]` in the requirements file allows Benchexec to set-up `cgroups` automatically.

Remember to make sure you are in the `app` virtual environment before running Benchexec:

```shell
$ source ~/virtualenv/app/bin/activate
```

### Configuring an experiment benchmark: Tools + Tasks

T benchmark a particular solver (possibly under different settings), one needs to provide (all under `experiments/benchexe/`):

1. A **solver tool** Python script, defining the solver that will be benchmarked. This includes the executable of the solver and the processing of its output (e.g., to extract policy size).
   * Tool definitions for solvers `pp-fond` and `pp-lpg` can be found in module `benchexec.tools` (under `src/python`).
2. A set of **tasks** defining each instance to be solved, as an YAML file specifying input files (domain and problem) and output folder.
   * Tasks for our problems can be found under `experiments/benchexe/tasks` folder. These tasks have been generated automatically using script [experiments/benchexe/gen_tasks.py](experiments/benchexe/gen_tasks.py).
3. A main **benchmark definition**, as an XML file, defining solver tool, resource limits, tasks to run, etc. One creates one XML file per tool.
   * Benchmark definition XML files can be found in `benchmark-prp.xml`, `benchmark-prp2.xml`, and `benchmark-lpg.xml`, for the different solver tools.

More explanation on this can be found [here](https://github.com/sosy-lab/benchexec/blob/main/doc/benchexec.md) and definition of other terms can be found in the [Glossary](https://github.com/sosy-lab/benchexec/blob/main/doc/INDEX.md).

Before running the benchmarks we need to make sure the various _tool_ definitions (as used in the XML benchmark definitions) are available. This can be done by changing variable [PYTHONPATH](https://docs.python.org/3/using/cmdline.html#envvar-PYTHONPATH) so that module `benchexec` can be found by Python:

```shell
$ export PYTHONPATH=$PWD/src/python
```

You may also need to make sure all the required binaries (e.g., planners) used by the tools are in the path. One way is to make them all available under `bin/` and set:

```shell
$ export PATH=$PATH:$PWD/bin
```

### Running a benchmark

Finally, to benchmark a solver one passes the main benchmark definition XML file with the required arguments. For example, the command below runs the PRP PP-FOND tool on 3 APP problems in parallel (`-N 3`) with one core per problem (`-c 1`):

```shell
$ benchexec experiments/benchexe/benchmark-prp.xml -N 3 -c 1 --tool-directory src/python/ --read-only-dir / --overlay-dir /home --hidden-dir $PWD/benchexec_output
....
....
15:01:37              AIJ_BlocksWorld_LIN10-110_75.yml     true                         1.71    1.72
15:01:37   starting   AIJ_BlocksWorld_LIN10-110_90.yml
15:01:37              AIJ_BlocksWorld_LIN10-110_70.yml     true                         1.84    1.85
15:01:37   starting   AIJ_BlocksWorld_LIN10-110_95.yml
15:01:37              AIJ_BlocksWorld_LIN10-110_80.yml     true                         1.60    1.61
15:01:38              AIJ_BlocksWorld_LIN10-110_85.yml     true                         1.84    1.85
15:01:39              AIJ_BlocksWorld_LIN10-110_90.yml     true                         1.61    1.62
15:01:39              AIJ_BlocksWorld_LIN10-110_95.yml     true                         1.68    1.68

Statistics:             21 Files
  correct:               0
    correct true:        0
    correct false:       0
  incorrect:             0
    incorrect true:      0
    incorrect false:     0
  unknown:               0

In order to get HTML and CSV tables, run
table-generator results/benchmark-prp-test.prp.2024-03-24_15-01-29.results.prp.BlocksWorld.xml.bz2
```

The `---tool-directory` tells Benchexec where the tools' executables (e.g., `pp-fond.py`) are located. If this parameter is not given, Benchexec searches in the directories of the `PATH` environment variable and in the current directory.

The last three options refer to [container configurations](https://github.com/sosy-lab/benchexec/blob/main/doc/container.md#container-configuration):

* `--read-only-dir /`: allows the container to access all the file-system in read mode
* `--overlay-dir /home`: allows Benchexec to access all `/home/` as an overlay transparent file system:
  * All the existing data there is accessible for read unless it is hidden via `--hidden-dir`.
  * _New_ data/files can be written (e.g., log files of the run), but it will be done on RAMDISK and hence will be counted towards memory usage, unless `--no-tmpfs` option is used, in which case writes will go to disk and NOT counted as memory usage (note that even in this case, Linux may still write to cache memory if available! see thread discussion we had in issue [#1025](https://github.com/sosy-lab/benchexec/issues/1025)).
  * If we want to retrieve anything that is written by the execution, it has to be specified in the `<resultsfiles>` section in the XML configuration files. The retrieved files will be accessible under the Benchexec result folder (but by just a bulk copy a the end of the execution, not by writing directly there while running!).
* `--hidden-dir`: the host directory specified will be hidden in the container. This allows the process to use that directory "fresh" without clashing with whatever is already there in the host. In our case, we hide the directory where the output of the solver is meant to be located, in case such folder already exists in the host. If it does and we don't hide it, the solver will try to re-create the folder but since it does exist in the overlay in read-mode, the solver will crash with I/O error because it cannot remove a folder that is in already in the host.

By default, the container then runs in isolation, with writes to file system done in RAM memory. If we want to give the container full direct access to some part of the file-system, we can use for example `--full-access-dir /home/$USER`. Then, anything that is done under `/home/$USER` will be as if running in the host directly.

Note that the `--overlay-dir` does give access to the host file system in the container, but only on read-mode for what already exists.

**NOTE:** while in principle one should be able to use any overlay directory, it seems Benchexec creates a virtual home folder under `home/benchexec`, so it is hard-coded. See [this code](https://github.com/sosy-lab/benchexec/blob/64d73c47e05a1487727c4777e23863ce4ed4851a/benchexec/container.py#L55). So, if we give say `/home/ssardina`, Benchexec complains it cannot create such `home/benchexec`.


### Output of Benchexec

To learn about the outputs left by Benchexec, please check [HERE](https://github.com/sosy-lab/benchexec/blob/main/doc/benchexec.md#benchexec-results).

You can generarte a CSV table with all the results for further analysis, for example via Pandas. Check how to generate these tables [HERE](https://github.com/sosy-lab/benchexec/blob/main/doc/table-generator.md).

When generative a table, each row is a _task_ (e.g., APP problem instance) and columns record the results for each _run definition_ (e.g., LPG and LPG-SMALL). This means that for each run definition, there will be a set of columns with the same header.


### Runexec tool: single benchexec runs

We can use the [`runexec`](https://github.com/sosy-lab/benchexec/blob/main/doc/runexec.md) tool to run a particular script/program on the spot ocne (i.e., without XML, tools, etc. configurations).

Some simple scripts for testing were done in the context of issue [#1025](https://github.com/sosy-lab/benchexec/issues/1025) in folder [`experiments/benchexe/benchexec-test/`](experiments/benchexe/benchexec-test/).

Script `benchexec.sh` basically writes a dummy 500MB file. Let us see how much memory it uses.

We can do a run on container (default) mode that also recovers all the output files:

```shell
$ runexec --read-only-dir / --overlay-dir /home/ --result-files "*" ./benchexec.sh
2024-05-02 13:28:28 - INFO - Starting command ./benchexec.sh
2024-05-02 13:28:28 - INFO - Writing output to output.log and result files to output.files
2024-05-02 13:28:29 - WARNING - System has swapped during benchmarking. Benchmark results are unreliable!
starttime=2024-05-02T13:28:28.879608+10:00
returnvalue=0
walltime=0.4416085880002356s
cputime=0.440638s
memory=536940544B
blkio-read=0B
blkio-write=0B
pressure-cpu-some=0.000055s
pressure-io-some=0s
pressure-memory-some=0s
```

As we can see, the write of file was done in RAMDISK, that is why we can see 536MB of ram used.

If we put a 200MB limit to the RAM that can be used, then it will fail the run due to lack of memory in the RAMDISK:

```shell
$ runexec --read-only-dir / --overlay-dir /home/ --memlimit 200000000  ./benchexec.sh
2024-05-02 13:31:18 - INFO - Starting command ./benchexec.sh
2024-05-02 13:31:18 - INFO - Writing output to output.log
2024-05-02 13:31:19 - WARNING - System has swapped during benchmarking. Benchmark results are unreliable!
starttime=2024-05-02T13:31:18.829565+10:00
terminationreason=memory
exitsignal=9
walltime=0.2236796350007353s
cputime=0.219102s
memory=199999488B
blkio-read=0B
blkio-write=0B
pressure-cpu-some=0.005097s
pressure-io-some=0s
pressure-memory-some=0.000866s
```

However, if we use the `--no-tmpfs` option, we are telling benchexec to NOT use RAMDISK and use the actual drive:

```shell
$ runexec --read-only-dir / --overlay-dir /home/ --no-tmpfs  --memlimit 200000000  ./benchexec.sh
2024-05-02 13:33:07 - INFO - Starting command ./benchexec.sh
2024-05-02 13:33:07 - INFO - Writing output to output.log
starttime=2024-05-02T13:33:07.793504+10:00
returnvalue=0
walltime=0.846914204001223s
cputime=0.695673s
memory=199999488B
blkio-read=0B
blkio-write=504537088B
pressure-cpu-some=0.00134s
pressure-io-some=0.090341s
pressure-memory-some=0.058133s
```

We can see here that it _does_ finish because RAMDISK is not used due to the `--no-tmpfs` option. However, note that it still uses 200MB of RAM, because Linux writes the file to cache as long as it is available (and will dump to disk when it has to free it).


### Problems

#### Unsupported tool "benchexe.tool_fond" specified. ImportError: No module named 'benchexe'

Python cannot find the module `benchexec` where all the tools are located. Set `PYTHONPATH` so that the module `benchexec` where all the tools are located is found by Python:

```shell
$ export PYTHONPATH=$PWD/src/python
```

### ModuleNotFoundError: No module named 'XXXXXX' (BenchExec log files)

We are not running Benchexec in a Python virtual environment with all dependencies installed, so packages cannot be found. Do not run Benchexec relying on system-wide Python modules. Instead create an `app` virtual environment that has all dependencies (see above).

