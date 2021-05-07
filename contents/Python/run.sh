#!/usr/bin/env bash

isDockerfile=""
filename=""
dockerfilepath="none"

Usage ()
{	
	echo "./run.sh [OPTIONS]"
	echo "----------------"
	echo "OPTIONS"
	echo "--is-dockerfile : Create Docker Image from Dockerfile (Default is ./Dockerfile)"
	echo "--is-dockerfile -f <Dockerfile Path>"
	echo "--file-name <Target File Path from Current Directory>"
	echo "--help -h : Show Help"
	exit 1
}

if [[ -z "$@" ]];then
	Usage
fi

for OPT in "$@"
do
	case $OPT in
		--is-dockerfile )
			shift 1
			if [[ "$1" == "-f" ]];then
				shift 1
				dockerfilepath="$1"
				shift 1
			else
				dockerfilepath="./Dockerfile"
			fi
			;;
		--file-name )
			shift 1
			filename="$1"
			shift 1
			;;
		--help | -h )
			Usage
			;;
	esac
done

echo -n  "filename = $filename, dockerfile-path = $dockerfilepath Are you OK?[y/n]"
read ask
if [[ "$ask" == "n" ]];then
	exit 1;
fi

if [[ "$dockerfilepath" == "none" ]]; then
	docker run --rm -t -v $(pwd):/home/Tester -u Tester -w /home/Tester --name TestContainer unicatflower/gcc:user /bin/bash -c "./tester.sh $filename"
else
	docker build -f $(basename $dockerfilepath) $(dirname "$dockerfilepath") -t testerimage
	docker run --rm  -t -v $(pwd):/home/Tester -u Tester -w /home/Tester --name TestContainer testerimage /bin/bash -c "chmod 755 tester.sh; ./tester.sh $filename;"
fi
