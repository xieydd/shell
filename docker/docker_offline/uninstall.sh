#!/bin/sh

echo 'Delete Docker.service...'
rm -f /etc/systemd/system/docker.service

echo 'Delete docker ...'
rm -rf /usr/bin/docker*

echo 'Daemon-reload'
systemctl daemon-reload

echo 'Uninstall Docker Successful...'
