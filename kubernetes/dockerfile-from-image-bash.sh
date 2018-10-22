#!/bin/bash
sudo wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -ivh epel-release-latest-7.noarch.rpm
sudo yum install jq -y

IMAGE=$1
docker history ${IMAGE} | \
awk '{print $1}' | \
grep -v IMAGE | grep -v missing | \
tac | \
sed "s/\(.*\)/docker inspect \1 | \
jq -r \'.[0].ContainerConfig.Cmd[2] | tostring\'/" | \
sh | \
sed 's/^#(nop) //'
