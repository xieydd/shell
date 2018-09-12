#!/bin/bash 
#未完成，这里需要修改/etc/yum.repos.d/Local.repo
#并设定参数进行判定是nfs-service还是nfs-client
#####Server#######
yum -y install rpcbind nfs-utils

systemctl start rpcbind
systemctl start nfs-server.service

systemctl enable rpcbind nfs-utils

#下面的IP根据nfs server的ip进行修改
cat > /etc/exports << EOF
/root/nfs 192.168.5.0/24(rw,sync,no_root_squash)
EOF
##################
#####Client#######
mkdir -p /root/nfs
chmod 666 /root/nfs


yum -y install  nfs-utils

mkdir -p /root/nfs
chmod 666 /root/nfs
mount  192.168.5.78:/root/nfs /root/nfs/
#################
