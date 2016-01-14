#!/bin/bash
set -u

DIR=`pwd`


if [ "$1" = "all" ]
	then
		for benchmark in `cat $DIR/conf/benchmarks.lst`; do
			if [[ $benchmark == \#* ]]; then
				continue
			fi

			WORKLOAD=$DIR/workloads/${benchmark}
			"${WORKLOAD}/prepare/prepare.sh"

			if [ $? -ne 0 ]
				then
				echo "ERROR: ${benchmark} prepare failed!" 
				continue
			fi
		done
else
		./workloads/"$1"/prepare/prepare.sh
		if [ $? -ne 0 ]
			then
			echo "ERROR: ${1} prepare failed!" 
		fi
fi

