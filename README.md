# Agent Planning Programs

This repo has a set of solvers and benchmarking scripts for _Agent Planning Programs_, as reported in:

* Nitin Yadav, Sebastian Sardina, Hector Geffner: [{Agent Planning Programs as Non-deterministic Planning under Fairness](https://linkinghub.elsevier.com/retrieve/pii/S0004370215001563). Proceedings of the Interntional Confernece on Automated Planning and Scheduling (2025), Melbourne, AUSTRALIA.

Agent Planning Programs were first introduced at AAMAS'10 and then expanded at AIJ'16:

* Giuseppe De Giacomo, Alfonso Emilio Gerevini, Fabio Patrizi, Alessandro Saetti, Sebastian Sardiña: [Agent planning programs](https://linkinghub.elsevier.com/retrieve/pii/S0004370215001563). Artificial Intelligence 231: 64-106 (2016)
* Giuseppe De Giacomo, Fabio Patrizi, Sebastian Sardiña: [Agent programming via planning programs](https://dl.acm.org/citation.cfm?id=1838276). AAMAS 2010: 491-498

The repo contains two solvers:

1. **PP-FOND**: this solver involves translating an APP problem to a FOND problem under strong-cyclic solution concept.
2. **PP-LPG**: this solver was introduced in AIJ'16 paper and solves APP by repetitively calling a modified version of classical planner [LPG](http://zeus.ing.unibs.it/lpg/), a local search preference-based planning system, to build a whole solution for the APP task. 

## Contributors

- Prof. Sebastian Sardina
- Dr. Nitin Yadav
- Prof. Hector Geffner
-  Alessandro Saiettei.
-  ..Fabio..
-  Giuseppe
-  Alfonso
