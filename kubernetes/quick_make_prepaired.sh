#!/bin/bash
# KUBE_BUILD_PLATFORMS=linux/amd64 KUBE_BUILD_CONFORMANCE=n KUBE_BUILD_HYPERKUBE=y make quick-release GOFLAGS=-v GOGCFLAGS="-N -l"
docker pull gcrcontainer/kube-cross:v1.12.7-1 && docker tag gcrcontainer/kube-cross:v1.12.7-1 k8s.gcr.io/kube-cross:v1.12.7-1
