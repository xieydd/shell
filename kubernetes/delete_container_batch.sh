#!/bin/bash
NAME=$1
STATUS=$2
if [ $NAME ];then
	docker rm -f $(docker ps -a |  grep "$NAME*"  | awk '{print $1}')
else if [ $STATUS ]; then
	docker rm $(sudo docker ps -qf status=$STATUS) -f
