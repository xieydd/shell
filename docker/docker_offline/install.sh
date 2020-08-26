#!/bin/sh
echo 'Unzip tar ...'
tar -xvf $1

echo 'cp docker bin to /usr/bin/...'
cp docker/* /usr/bin/

echo 'cp docker.service to /etc/systemd/system/ ...'
cp docker.service /etc/systemd/system/

echo 'chmod ...'
chmod +x /etc/systemd/system/docker.service

echo 'Daemon Reload...'
systemctl daemon-reload

echo 'Start docker...'
systemctl start docker

echo 'Enable docker...'
systemctl enable docker.service

echo 'docker install succcessful...'
docker -v
