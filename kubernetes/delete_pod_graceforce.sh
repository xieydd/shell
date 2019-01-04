#!/bin/bash
STATUS=$1
kubectl get pods --all-namespaces -o wide | awk `if ($4 == ${STATUS}) print $2 " -n " $1` | xargs -l kubectl delete pod --grace-period=0 --force
