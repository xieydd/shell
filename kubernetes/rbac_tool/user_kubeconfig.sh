#!/bin/bash
# sh bash.sh --USER --USERNAME --KUBE_APISERVER
USER=$1
NAMESPACE=$2
KUBE_APISERVER=$3

/usr/local/bin/kubectl config set-cluster kubernetes \
--certificate-authority=/etc/kubernetes/ssl/ca.pem \
--embed-certs=true \
--server=${KUBE_APISERVER} \
--kubeconfig=config

/usr/local/bin/kubectl config set-credentials ${USER} \
--client-certificate=/etc/kubernetes/ssl/${USER}.pem \
--client-key=/etc/kubernetes/ssl/${USER}-key.pem \
--embed-certs=true \
--kubeconfig=config

/usr/local/bin/kubectl config set-context kubernetes \
--cluster=kubernetes \
--user=${USER} \
--namespace=${USERNAME} \
--kubeconfig=config

/usr/local/bin/kubectl config use-context kubernetes --kubeconfig=config
