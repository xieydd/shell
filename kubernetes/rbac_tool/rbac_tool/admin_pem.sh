#!/bin/bash
# sh bash.sh --ADMIN
ADMIN=$1

if [[ ! -d /etc/kubernetes/ssl ]]; then
    mkdir /etc/kubernetes/ssl
fi

openssl genrsa -out /etc/kubernetes/ssl/${ADMIN}-key.pem 2048
openssl req -new -key /etc/kubernetes/ssl/${ADMIN}-key.pem -out /etc/kubernetes/ssl/${ADMIN}.csr -subj "/CN=admin/O=system:masters"
openssl x509 -req -in /etc/kubernetes/ssl/${ADMIN}.csr -CA /etc/kubernetes/ssl/ca.pem -CAkey /etc/kubernetes/ssl/ca-key.pem -CAcreateserial -out /etc/kubernetes/ssl/${ADMIN}.pem -days 1000
