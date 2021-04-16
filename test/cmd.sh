#!/bin/zsh
echo $1
docker run --rm -v $(pwd):/home/Tester -u Tester -w /home/Tester -e CASES=5 --name $1 unicatflower/gcc:user /bin/bash -c ./tester.sh