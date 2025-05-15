#!/bin/zsh
#
# This script runs a solver fixed number of times to replicate an instance
#
# provide no of samples per repeat and the solver pp-XXX.sh to use (lpg or fond)
#
#   ./src/shell/repeat.sh 1 fond                                                                                                                                  ─╯
NO_ARGS=$# # Get the number of arguments passed in the command line
MY_NAME=${0##*/}
DIR_SCRIPT=$(dirname $0) # Find path of the current script

if [ "$NO_ARGS" -lt 2 ]; then
    printf "usage: ./$MY_NAME <no of samples per repeat> <solver: lpg or fond>\n"
    exit
fi

SOLVER="pp-$2.sh"
REPEATS=$1

DOMAIN="./benchmarks/AIJ16/BlocksWorld/domain.pddl"
INSTANCE="./benchmarks/AIJ16/BlocksWorld/EIGHT50/prob020.pddl"
SAMPLES=10

DIR=./repeats

if [ -d "$DIR" ]; then
    echo "$DIR already exists with data. Please delete it if it does exist to repeat again."
    exit
fi

# create directory to save the time and policy size
mkdir -p $DIR/$REPEATS

# sample
for j in {1..$SAMPLES}; do
    mkdir -p $DIR/$REPEATS/$j
    for i in {1..$REPEATS}; do
        echo "Run: $j,$i"
        # $SOLVER $DOMAIN $INSTANCE --output repeats/$REPEATS/$j 2>&1 | grep -E 'Found a policy of size [0-9]*|Time taken: [0-9]*' >> "repeats/$REPEATS/$j,$i.txt" &
        $SOLVER $DOMAIN $INSTANCE --output $DIR/$REPEATS/$j/$i &>\dev\null &
    done
    wait
done
