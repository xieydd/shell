#!/bin/bash
# sh bash.sh --ADMIN
ADMIN=$1
KUBE_APISERVER=$2

/usr/local/bin/kubectl config set-cluster kubernetes \
--certificate-authority=/etc/kubernetes/ssl/ca.pem \
--embed-certs=true \
--server=${KUBE_APISERVER} \
--kubeconfig=config

/usr/local/bin/kubectl config set-credentials default \
--client-certificate=/etc/kubernetes/ssl/${ADMIN}.pem \
--client-key=/etc/kubernetes/ssl/${ADMIN}-key.pem \
--embed-certs=true \
--kubeconfig=config

/usr/local/bin/kubectl config set-context kubernetes \
--cluster=kubernetes \
--user=default \
--kubeconfig=config

/usr/local/bin/kubectl config use-context kubernetes --kubeconfig=config
