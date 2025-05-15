#!/bin/bash
# Shell script interface to Python src/python/pp-lpg.py

set -e

REALPATH=$(realpath $0)
BASEDIR="$(dirname "$REALPATH")"
# echo $BASEDIR

PLANNER="python $BASEDIR/../python/pp-lpg.py ${@:1}"
$PLANNER
