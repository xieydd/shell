#!/bin/bash

nodes=`cat $1`
for i in $nodes
do
    echo $i
    ssh root@${i} -i "ls /root/"
done
