#!/bin/zsh

/usr/bin/gcc main.c -o main

for i in {1..$CASES};
do
    ./main < input/$i.txt > output/$i.txt
done
echo 1 >> STATE.txt