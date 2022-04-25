#!/bin/bash

elf_file=$1
outputs="outputs"

if [ $# -ge 2 ];
then
    outputs=$2
fi

mkdir -p "$outputs"

timeout 3 rusty-loader "inputs/$elf_file" > "$outputs/$elf_file.out" 2> "/tmp/$elf_file.segments"
echo $? > "$outputs/$elf_file.code"
cat "/tmp/$elf_file.segments" | tr -s '\t' ' ' > "$outputs/$elf_file.segments"
