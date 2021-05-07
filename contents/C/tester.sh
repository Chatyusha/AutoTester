#!/usr/bin/env bash
set -e
# Compile and Test C file with gcc

filename="$1"
basename=${filename%.*}

gcc "$filename" -o "$basename"

for i in ./tests/input/*;
do
	"./$basename" < "$i" | tee  "./tests/output/$(basename $i)" 
done
rm -f "./$basename"
