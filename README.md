# Agent Planning Programs

This repo has a set of solvers and benchmarking scripts for _Agent Planning Programs_, as reported in:

* Nitin Yadav, Sebastian Sardina, Hector Geffner: [{Agent Planning Programs as Non-deterministic Planning under Fairness](https://linkinghub.elsevier.com/retrieve/pii/S0004370215001563). Proceedings of the Interntional Confernece on Automated Planning and Scheduling (2025), Melbourne, AUSTRALIA.

Agent Planning Programs were first introduced at AAMAS'10 and then expanded at AIJ'16:

* Giuseppe De Giacomo, Alfonso Emilio Gerevini, Fabio Patrizi, Alessandro Saetti, Sebastian Sardiña: [Agent planning programs](https://linkinghub.elsevier.com/retrieve/pii/S0004370215001563). Artificial Intelligence 231: 64-106 (2016)
* Giuseppe De Giacomo, Fabio Patrizi, Sebastian Sardiña: [Agent programming via planning programs](https://dl.acm.org/citation.cfm?id=1838276). AAMAS 2010: 491-498

The repo contains two solvers:

1. [**PP-FOND**](#pp-fond): this solver involves translating an APP problem to a FOND problem under strong-cyclic solution concept.
2. [**PP-LPG**](#pp-lpg): this solver was introduced in AIJ'16 paper and solves APP by repetitively calling a modified version of classical planner [LPG](http://zeus.ing.unibs.it/lpg/), a local search preference-based planning system, to build a whole solution for the APP task. 

## PP-FOND
This tool provides a high-level interface for working with APP (Agent Planning Problems) using FOND (Fully Observable Non-Deterministic) planners. It supports translating APP problems to PDDL, and solving them with a few FOND planners. The entry point to the solver is `src/python/pp-fond.py`

### Usage
Positional Arguments

    domain: The domain PDDL file. 

    problem: The APP problem file.

Optional Arguments

    --mode: Specifies the functionality of the system. Options are:

        translate: Translate APP problem to FOND PDDL.

        solve (default): Solve the APP using a FOND planner.

    --timeout: Timeout per run in seconds. Default is 1800 seconds (30 minutes).

    --planner: Which FOND planner to use. Available options are [prp (default), pr2, fondsat, paladinus]. The binaries for these planners are hardcoded in the code and should be available on the path. The names of the binaries are as below:
            SOLVER_PRP = "prp"
            SOLVER_PR2 = "pr2"
            SOLVER_PALADINUS = "paladinus"
            SOLVER_FONDSAT = "fondsat"

    --output: Path to a directory where output files should be stored.

    -e, --empty: Clears the output directory before running.

    -q, --quiet: Enables quiet mode with minimal output.

    --planner_args: Additional arguments to be passed directly to the FOND planner.

    --disable_invariant: Disables invariant analysis in the pre-processing phase. This is relevant only for PRP and PR2. We assume a separate binary for the planner that has disabled invariant analysis. These binaries should be called "prp_inv0", and "pr2_inv0" for PRP and PR2, respectively.

### Example
```bash
$ python ./src/python/pp-fond.py ./benchmarks/AIJ16/BlocksWorld/domain.pddl ./benchmarks/AIJ16/BlocksWorld/RND6/prob001.pddl --planner pr2 --output ./output

.
.
.
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] 
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] 
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]             -----------------------------------
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]                   { General Statistics }
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]             -----------------------------------
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] 
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]                          Time taken: 0.00317824 sec
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]                            # Rounds: 1
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]                     # Weak Searches: 9
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]                       Solution Size: 24
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]                           FSAP Size: 0
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]                        Poison Count: 0
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] 
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] -------------------------------------------------------------------
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] 
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] 
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] Running the simulation...
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] 
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]             --------------------------------------
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]                   { Simulation Statistics }
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]             --------------------------------------
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] 
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]                           Trials: 100
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]                            Depth: 1000
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]                          Success: 100        (100.00 %)
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]                         Failures: 0  (0.00 %)
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] 
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]  Failures due to unhandled state: 0  (nan %)
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]      Failures due to depth limit: 0  (nan %)
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] 
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]       Mean successful run length: 6.13
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER]   Mean (state-)failed run length: 0.00
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] 
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] -------------------------------------------------------------------
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] 
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] Dumping the policy and fsaps...
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] 
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] Peak memory: 410099632 KB
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] Command '['/Users/nitiny/Tools/Planners/prp2/pr2/builds/release64/bin/downward', '--search', 'prpsearch()', '--internal-plan-file', 'sas_plan']' returned non-zero exit status 9.
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [SOLVER] 
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [INFO] Found a policy of size: 24
2025-05-15 13:43:52 3330L-212245-M APP-PR2 [INFO] FOND Solve Time: 0.2639072500169277
2025-05-15 13:43:52 3330L-212245-M __main__[56338] INFO Time taken (wall): 0.3503777500009164.
```
## PP-LPG
This tool provides a high-level interface for working with APP (Agent Planning Problems) using the LPG planner. It supports translating APP problems to a format that the LPG solver accepts, and solving them the LPG planner. The entry point to the solver is `src/python/pp-lpg.py`

### Usage
Positional Arguments

    domain: The domain PDDL file.

    problem: The APP problem input.
Optional Arguments

--mode: Specifies the functionality of the system. Options are:

        translate: Translate APP problem to LPG inputs.

        solve (default): Solve the APP problem using LPG.

    --timeout:
    Timeout in seconds per run. Default: 1800 seconds (30 minutes).

    --seed:
    Random seed to control the behavior of the LPG planner. 

    --solver:
    Path to the LPG solver binary or version to use. Default: pp-lpg.

    --output:
    Path to the directory where outputs (e.g., plans, logs) will be saved.

    -q, --quiet:
    Enable quiet mode, limiting output to essential information only.
### Example
```bash
$ python src/python/pp-lpg.py ./benchmarks/AIJ16/BlocksWorld/domain.pddl ./benchmarks/AIJ16/BlocksWorld/RND6/prob001.pddl                  

.
.
.
2025-05-15 15:51:34 pacman04 APP-LPG [SOLVER] # Size of solution (number of plans): 9
2025-05-15 15:51:34 pacman04 APP-LPG [SOLVER] ####### CURRENT GRAPH - END #######
2025-05-15 15:51:34 pacman04 APP-LPG [SOLVER] 
2025-05-15 15:51:34 pacman04 APP-LPG [SOLVER] 
2025-05-15 15:51:34 pacman04 APP-LPG [SOLVER] List of current flaw:
2025-05-15 15:51:34 pacman04 APP-LPG [SOLVER] No flaws
2025-05-15 15:51:34 pacman04 APP-LPG [SOLVER] SUCCESS!
2025-05-15 15:51:34 pacman04 APP-LPG [SOLVER] Size of policy solution (as number of plans): 9
2025-05-15 15:51:34 pacman04 APP-LPG [SOLVER] 
2025-05-15 15:51:34 pacman04 APP-LPG [INFO] Found a policy of size (no of plans): 9
2025-05-15 15:51:34 pacman04 APP-LPG [INFO] Found a policy of size (no of actions): 18
2025-05-15 15:51:34 pacman04 APP-LPG [INFO] LPG Solve Time: 8.453671073017176
2025-05-15 15:51:34 pacman04 __main__[129473] INFO Time taken: 8.739954399003182.
```
## Contributors

- Prof. Sebastian Sardina
- Dr. Nitin Yadav
- Prof. Hector Geffner
-  Alessandro Saiettei.
-  ..Fabio..
-  Giuseppe
-  Alfonso
