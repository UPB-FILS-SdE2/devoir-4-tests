#!/bin/bash

elf_file=$1
type=$2
if [ "$type" == "out" -o "$type" == "segments" -o "$type" == "code" ];
then 
    diff --ignore-space-change --side-by-side --suppress-common-lines "outputs/$elf_file.$type" "solutions/$elf_file.$type" 
else
    echo "Please use one of out, segments or code"
    exit -1
fi
