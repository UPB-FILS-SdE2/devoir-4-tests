#!/bin/bash

rm -rf "solutions"
mkdir "solutions"

for file in inputs/*.c 
do
    if ! echo $file | grep lib > /dev/null;
    then
        ./run.sh $(basename $file | cut -d '.' -f 1) solutions
    fi
done