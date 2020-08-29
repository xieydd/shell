curl -Lo ./kind "https://github.com/kubernetes-sigs/kind/releases/download/v0.7.0/kind-$(uname)-amd64"
chmod +x ./kind
mv ./kind /usr/local/bin/kind

cat <<EOF | kind create cluster --name mine --config=-
  kind: Cluster
  apiVersion: kind.x-k8s.io/v1alpha4
  nodes:
  - role: control-plane
    kubeadmConfigPatches:
    - |
      kind: InitConfiguration
      nodeRegistration:
        kubeletExtraArgs:
          node-labels: "ingress-ready=true"
          authorization-mode: "AlwaysAllow"
    extraPortMappings:
    - containerPort: 80
      hostPort: 80
      protocol: TCP
    - containerPort: 443
      hostPort: 443
      protocol: TCP
  - role: worker
  - role: worker
  - role: worker
EOF
kubectl cluster-info --context kind-mine
kubectl create clusterrolebinding system:anonymous --clusterrole=cluster-admin --user=system:anonymous
