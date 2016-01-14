#!/bin/sh

while :
do
  bin/hdfs dfs -copyFromLocal HiBench-large /HiBench-large
  bin/hdfs dfs -copyToLocal /HiBench-large ./HiBench-large2
  rm -rf HiBench-large2
done

