#!/bin/bash

dir="$(dirname $0)"
main="$dir/main.py"

function run_test {
    rm -rf output
    inputfile="$dir/verify/$1"
    outputfile="$inputfile.$2.ref"
    echo $outputfile
    echo Running $inputfile
    python3 $main $2 3 $inputfile > output
    ERROR=0
    if ! diff output $outputfile -b --side-by-side > error;
    then
        echo "Your output                                           | Correct output"
        cat error
        ERROR=1
    else
        echo Correct
    fi
    rm -rf output
    rm -rf error
    return $ERROR
}

if [ $# -lt 1 ];
then
    echo "Not enough parameters"
else
    run_test $1 $2
fi 