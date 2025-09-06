# Agent Planning Programs

Agent Planning Programs (APPs) are generalization of AI planning problems, in which instead of a single goal, the agent needs to solve a network of interconnected goals, the "planning program".

Agent Planning Programs were first introduced at AAMAS'10 and then explored more at AIJ'16:

* Giuseppe De Giacomo, Alfonso Emilio Gerevini, Fabio Patrizi, Alessandro Saetti, Sebastian Sardiña: [Agent planning programs](https://linkinghub.elsevier.com/retrieve/pii/S0004370215001563). Artificial Intelligence 231: 64-106 (2016)
* Giuseppe De Giacomo, Fabio Patrizi, Sebastian Sardiña: [Agent programming via planning programs](https://dl.acm.org/citation.cfm?id=1838276). AAMAS 2010: 491-498

This repo has a set of _solvers_, _benchmarks_, and _scripts_ for APPS, as reported in:

* Nitin Yadav, Sebastian Sardina, Hector Geffner: [Agent Planning Programs as Non-deterministic Planning under Fairness](https://icaps25.icaps-conference.org/). ICAPS 2025, Melbourne, AUSTRALIA.

Two solvers are provided:

1. [**PP-FOND**](#pp-fond): solves an APP problem by translating it to a  FOND problem under strong-cyclic solution concept. This translation was first reported in ICAPS'25 paper above.
2. [**PP-LPG**](#pp-lpg): solves an APP by repetitively calling a (modified version of) classical planner [LPG](http://zeus.ing.unibs.it/lpg/), a local search preference-based planning system, to build a whole solution for the APP task. This technique was introduced in the AIJ'16 paper above.

The tools in this repo rely, and extend, package [pddl](https://github.com/AI-Planning/pddl) for parsing PDDL files. Make sure it is installed via `pip`. Tested with version 0.4.3.

- [Agent Planning Programs](#agent-planning-programs)
  - [Setup](#setup)
  - [APP-PDDL input format and benchmarks](#app-pddl-input-format-and-benchmarks)
  - [PP-FOND: APP via FOND Planning](#pp-fond-app-via-fond-planning)
  - [PP-LPG: APPs via Classical Planning](#pp-lpg-apps-via-classical-planning)
  - [Other related solvers and tools](#other-related-solvers-and-tools)
  - [Contributors](#contributors)

## Setup



## APP-PDDL input format and benchmarks

A set of benchmarks is provided under [benchmarks](benchmarks/). Each set of problems come from different publications. Refer to the [README.md](benchmarks/README.md) in that folder for details.

The problems are given in APP-PDDL format, an extension of PDDL to represent APPs. Domains are exactly as in standard PDDL. The problem file is a variant of a planning problem:

1. It is specified with `planprog` keyword: `(define (planprog prob1)`
2. The initial state of the APP is denoted with keyword `:init-app`, for example: `(:init-app n0)`
3. The transitions of the APP are specified under the `:transition` section as a list of terms `(nodefrom nodeto (:goal <condition>))`.

For example, an APP for the Barman domain is as follows:

```lisp
(define (planprog prob1)
(:domain barman)
(:objects
    shaker1 - shaker
    left right - hand
    shot1 - shot
    ingredient1 ingredient2 ingredient3 ingredient4 - ingredient
    cocktail1 cocktail2 cocktail3 - cocktail
    dispenser1 dispenser2 dispenser3 dispenser4 - dispenser
    l0 l1 l2 - level)

(:init
    (ontable shaker1)
    (ontable shot1)
    (dispenses dispenser1 ingredient1)
    (dispenses dispenser2 ingredient2)
    (dispenses dispenser3 ingredient3)
    ...)

(:init-app n0)
(:transitions
 (n0  n1  (:goal (and (contains shot1 cocktail2))))
 (n0  n2  (:goal (and (contains shot1 cocktail2))))
 (n0  n3  (:goal (and (contains shot1 cocktail1))))
 (n0  n6  (:goal (and (contains shot1 cocktail2))))
    ...)
)
```

> [!NOTE]
> This APP-PDDL format is a much more improved and clean-up version of the original set of APP problems done for the PP-LPG solver in AIJ'16 paper. There, APP were specified with a collection of files for easier handling by the PP-LPG solver. Such format is not used here and the meta-solvers in this repo will translate APP-PDDL specification to formats relevant for them, including the one required for the PP-LPG solver.

## PP-FOND: APP via FOND Planning

This tool provides a high-level interface for solving APPs (Agent Planning Problems) by translating to FOND (Fully Observable Non-Deterministic) problems. It implements the technique in:

* Nitin Yadav, Sebastian Sardina, Hector Geffner: [Agent Planning Programs as Non-deterministic Planning under Fairness](https://icaps25.icaps-conference.org/). ICAPS 2025, Melbourne, AUSTRALIA.

The entry point to the solver is script `src/python/pp-fond.py`. The script will first translate the APP task into a FOND planning problem and call a FOND planner to solve it. Currently, the solver supports the following FOND planners:

* [PRP](https://github.com/QuMuLab/planner-for-relevant-policies) (ICAPS'11): get the improved forked version [here](https://github.com/ssardina-research/planner-for-relevant-policies/).
* [PR2](https://mulab.ai/project/pr2/) (AAAI'24): the new iteration of PRP.
* [FOND-SAT](https://github.com/tomasgeffner/FOND-SAT) (ICAPS'18): get the improved forked version [here](https://github.com/ssardina-research/FOND-SAT).
* [PALADINUS](https://github.com/ramonpereira/paladinus) (ICAPS'22): FOND via iterative depth-first search.

The default planner used is PRP, but you can select which one to use via  `--planner` option: `pr`, `pr2`, `fondsat`, `paladinus`.

> [!NOTE]
> The FOND planner needs to be accessible from `PATH`. One way to do this is to have links to their binaries under `bin/` and add `bin/` to `PATH`

For example:

```bash
$ python ./src/python/pp-fond.py --planner pr2 --output ./output \
 ./benchmarks/AIJ16/BlocksWorld/domain.pddl ./benchmarks/AIJ16/BlocksWorld/RND6/prob001.pddl

.
.
.
2025-05-15 13:43:52  APP-PR2 [SOLVER]
2025-05-15 13:43:52  APP-PR2 [SOLVER]
2025-05-15 13:43:52  APP-PR2 [SOLVER]             -----------------------------------
2025-05-15 13:43:52  APP-PR2 [SOLVER]                   { General Statistics }
2025-05-15 13:43:52  APP-PR2 [SOLVER]             -----------------------------------
2025-05-15 13:43:52  APP-PR2 [SOLVER]
2025-05-15 13:43:52  APP-PR2 [SOLVER]                          Time taken: 0.00317824 sec
2025-05-15 13:43:52  APP-PR2 [SOLVER]                            # Rounds: 1
2025-05-15 13:43:52  APP-PR2 [SOLVER]                     # Weak Searches: 9
2025-05-15 13:43:52  APP-PR2 [SOLVER]                       Solution Size: 24
2025-05-15 13:43:52  APP-PR2 [SOLVER]                           FSAP Size: 0
2025-05-15 13:43:52  APP-PR2 [SOLVER]                        Poison Count: 0
2025-05-15 13:43:52  APP-PR2 [SOLVER]
2025-05-15 13:43:52  APP-PR2 [SOLVER] -------------------------------------------------------------------
2025-05-15 13:43:52  APP-PR2 [SOLVER]
2025-05-15 13:43:52  APP-PR2 [SOLVER]
2025-05-15 13:43:52  APP-PR2 [SOLVER] Running the simulation...
2025-05-15 13:43:52  APP-PR2 [SOLVER]
2025-05-15 13:43:52  APP-PR2 [SOLVER]             --------------------------------------
2025-05-15 13:43:52  APP-PR2 [SOLVER]                   { Simulation Statistics }
2025-05-15 13:43:52  APP-PR2 [SOLVER]             --------------------------------------
2025-05-15 13:43:52  APP-PR2 [SOLVER]
2025-05-15 13:43:52  APP-PR2 [SOLVER]                           Trials: 100
2025-05-15 13:43:52  APP-PR2 [SOLVER]                            Depth: 1000
2025-05-15 13:43:52  APP-PR2 [SOLVER]                          Success: 100        (100.00 %)
2025-05-15 13:43:52  APP-PR2 [SOLVER]                         Failures: 0  (0.00 %)
2025-05-15 13:43:52  APP-PR2 [SOLVER]
2025-05-15 13:43:52  APP-PR2 [SOLVER]  Failures due to unhandled state: 0  (nan %)
2025-05-15 13:43:52  APP-PR2 [SOLVER]      Failures due to depth limit: 0  (nan %)
2025-05-15 13:43:52  APP-PR2 [SOLVER]
2025-05-15 13:43:52  APP-PR2 [SOLVER]       Mean successful run length: 6.13
2025-05-15 13:43:52  APP-PR2 [SOLVER]   Mean (state-)failed run length: 0.00
2025-05-15 13:43:52  APP-PR2 [SOLVER]
2025-05-15 13:43:52  APP-PR2 [SOLVER] -------------------------------------------------------------------
2025-05-15 13:43:52  APP-PR2 [SOLVER]
2025-05-15 13:43:52  APP-PR2 [SOLVER] Dumping the policy and fsaps...
2025-05-15 13:43:52  APP-PR2 [SOLVER]
2025-05-15 13:43:52  APP-PR2 [SOLVER] Peak memory: 410099632 KB
2025-05-15 13:43:52  APP-PR2 [SOLVER] Command '['/Users/nitiny/Tools/Planners/prp2/pr2/builds/release64/bin/downward', '--search', 'prpsearch()', '--internal-plan-file', 'sas_plan']' returned non-zero exit status 9.
2025-05-15 13:43:52  APP-PR2 [SOLVER]
2025-05-15 13:43:52  APP-PR2 [INFO] Found a policy of size: 24
2025-05-15 13:43:52  APP-PR2 [INFO] FOND Solve Time: 0.2639072500169277
2025-05-15 13:43:52  __main__[56338] INFO Time taken (wall): 0.3503777500009164.
```

> [!TIP]
> To plug another FOND planner, one needs to extend `src/python/planners/fond.py`.

## PP-LPG: APPs via Classical Planning

This solver implements a meta-search on the APP graph on top of a classical planner, as described in:

* Giuseppe De Giacomo, Alfonso Emilio Gerevini, Fabio Patrizi, Alessandro Saetti, Sebastian Sardiña: [Agent planning programs](https://linkinghub.elsevier.com/retrieve/pii/S0004370215001563). Artificial Intelligence 231: 64-106 (2016)

The Python script first translates an APP-PDDL input to a format that the LPG-based APP solver accepts, and then call the LPG-based APP solver (which is provided in binary format under folder `bin/`).

The entry point to the solver is `src/python/pp-lpg.py`

```bash
$ python src/python/pp-lpg.py \
  ./benchmarks/AIJ16/BlocksWorld/domain.pddl ./benchmarks/AIJ16/BlocksWorld/RND6/prob001.pddl

.
.
.
2025-05-15 15:51:34  APP-LPG [SOLVER] # Size of solution (number of plans): 9
2025-05-15 15:51:34  APP-LPG [SOLVER] ####### CURRENT GRAPH - END #######
2025-05-15 15:51:34  APP-LPG [SOLVER]
2025-05-15 15:51:34  APP-LPG [SOLVER]
2025-05-15 15:51:34  APP-LPG [SOLVER] List of current flaw:
2025-05-15 15:51:34  APP-LPG [SOLVER] No flaws
2025-05-15 15:51:34  APP-LPG [SOLVER] SUCCESS!
2025-05-15 15:51:34  APP-LPG [SOLVER] Size of policy solution (as number of plans): 9
2025-05-15 15:51:34  APP-LPG [SOLVER]
2025-05-15 15:51:34  APP-LPG [INFO] Found a policy of size (no of plans): 9
2025-05-15 15:51:34  APP-LPG [INFO] Found a policy of size (no of actions): 18
2025-05-15 15:51:34  APP-LPG [INFO] LPG Solve Time: 8.453671073017176
2025-05-15 15:51:34  __main__[129473] INFO Time taken: 8.739954399003182.
```

## Other related solvers and tools

Other articles report solvers or optimisations to solve APPs (not available in this repo).

* [Porfirio HRI'25](https://ieeexplore.ieee.org/document/10973839/) develops the _Interaction Specification Language_ (ISL) to provide planning capabilities to robotic applications using goal graph-like structures very similar to APPs.
* However, these languages are largely decoupled from robots' automated task planning capabilities, rendering developers unable to explicitly leverage their robot's ability to plan its own actions
* 
* , which enables de-velopers to import and apply elements from a robot planning do-main in a graph-based programming paradigm
* [Falcone et. al SOCS'17](https://ojs.aaai.org/index.php/SOCS/article/view/18431) extends the LPG-based solver to reason across multiple sequential goals at once.
* [Lukás Chrpa eta al IJCAI'17](https://www.ijcai.org/proceedings/2017/135), extend the LPG-based solver to predict dead-ends across goals and also proposes an online version of the problem.
* [De Giacomo et al AAMAS'10](https://dl.acm.org/citation.cfm?id=1838276) proposes solving APPs via synthesis of LTL GR(1) specifications.

## Contributors

The repo ws put together and is maintained by Nitin Yadav and Sebastian Sardina (<ssardina@gmail.com>), but the techniques, implementations, and benchmarks have been developed by the authors of various papers on APPs.