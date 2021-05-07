#!/usr/bin/env bash
set -e
# Test python file with python3

filename="$1"
basename=${filename%.*}

for i in ./tests/input/*;
do
	python3  "./$filename" < "$i" | tee  "./tests/output/$(basename $i)" 
done
