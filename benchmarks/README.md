# Benchmarks

This folder includes APP problem instances in APP-PDDL format.

- [Benchmarks](#benchmarks)
  - [Agent Planning Programs Encoding](#agent-planning-programs-encoding)
  - [AIJ'16 Agent Planning Programs Benchmark](#aij16-agent-planning-programs-benchmark)
  - [IJCAI'17 Trapper Benchmark](#ijcai17-trapper-benchmark)
  - [SOCS'17 Benchmark](#socs17-benchmark)
  - [FOND Benchmark]((#fond-benchmark))

## Agent Planning Programs Encoding

These are different APP problems in the new **APP-PDDL** format:

* The domain file is a standard PDDL domain specification.
* The problem file is a variant of a planning problem: rather than having a goal, it contains the APP to be realised.
  * It is specified with `planprog` keyword: `(define (planprog prob1)`
  * The initial state of the APP is denoted with keyword `:init-app`, for example: `(:init-app n0)`
  * The transitions of the APP are specified under the `:transition` section, for example:

    ```
    (:transitions
        (n0  n1  (:goal (and (contains shot1 cocktail2))))
        (n1  n2  (:goal (and (contains shot1 cocktail2))))
        (n2  n3  (:goal (and (contains shot1 cocktail1))))
        (n3  n4  (:goal (and (contains shot1 cocktail3))))
    ```

Some problems where generated using the generator found [here](https://lpg.unibs.it/ipc-5/generators/index.html).

**NOTE:** The APP-PDDL format is a much more improved and clean-up version of the original set of APP problems done for the PP-LPG solver in AIJ'16 paper. There, APP were specified with a collection of files for easier handling by the PP-LPG solver. Such format is not used here and the meta-solvers in this repo will translate APP-PDDL specification to formats relevant for them, including the one required for the PP-LPG solver.

## AIJ'16 Agent Planning Programs Benchmark

This benchmark is a cleanup of the one developed and used in the following AIJ 2016 paper:

* Giuseppe De Giacomo, Alfonso Emilio Gerevini, Fabio Patrizi, Alessandro Saetti, Sebastian Sardiña:
[Agent planning programs](https://linkinghub.elsevier.com/retrieve/pii/S0004370215001563). Artificial Intelligence 231: 64-106 (2016)

The benchmark is organized in two level folders:

1. The first folder denotes the domain (e.g., `Blocksworld/`).
2. The scond folder denotes the on shape of the APPs (e.g., `RND/` for random APPs).

## IJCAI'17 Trapper Benchmark

These are the problems used in the [Trapper APP solver](https://github.com/ssardina-research/app-trapper/tree/master/Benchmarks), published at IJCAI'17:

* Lukás Chrpa, Nir Lipovetzky, Sebastian Sardiña: [Handling non-local dead-ends in Agent Planning Programs](https://www.ijcai.org/Proceedings/2017/135). IJCAI 2017: 971-978

## SOCS'17 Benchmark

These are the new problems reported in the following paper:

* Federico Falcone, Alfonso Emilio Gerevini, Alessandro Saetti: [On Realizing Planning Programs in Domains with Dead-End States](https://aaai.org/papers/00020-18431-on-realizing-planning-programs-in-domains-with-dead-end-states/). SOCS 2017: 20-28

These are domains with many dead-ends.

## FOND Benchmark
This is a benchmark consisting of non-deterministic domain from Blocksworld. The APP program graphs are the same from Blocksworld domain from AIJ'16, except for the domain.