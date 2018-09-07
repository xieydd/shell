#!/bin/bash
# sh bash.sh --USER
USER=$1
if [[ ! -d /etc/kubernetes/ssl ]]; then
    mkdir /etc/kubernetes/ssl
fi

openssl genrsa -out /etc/kubernetes/ssl/${USER}-key.pem 2048
openssl req -new -key /etc/kubernetes/ssl/${USER}-key.pem -out /etc/kubernetes/ssl/${USER}.csr -subj "/CN=${USER}"
openssl x509 -req -in /etc/kubernetes/ssl/${USER}.csr -CA /etc/kubernetes/ssl/ca.pem -CAkey /etc/kubernetes/ssl/ca-key.pem -CAcreateserial -out /etc/kubernetes/ssl/${USER}.pem -days 1000
