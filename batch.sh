#!/bin/bash

nodes=`cat $1`
for i in $nodes
do
    echo $i
done
