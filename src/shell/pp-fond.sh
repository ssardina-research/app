#!/bin/bash
# Shell script interface to Python src/python/pp-fond.py

set -e

REALPATH=$(realpath $0)
BASEDIR="$(dirname "$REALPATH")"
# echo $BASEDIR

PLANNER="python $BASEDIR/../python/pp-fond.py ${@:1}"
$PLANNER
