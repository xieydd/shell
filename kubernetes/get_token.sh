#!/usr/bin/env bash
echo "Token for ${USER}:"
token=$(kubectl -n ${USER} get secret | grep ${USER} | awk '{print $1}' | xargs -I {} kubectl -n ${USER} get secret {} -o jsonpath={.data.token}| base64 -d)
echo ${token}
