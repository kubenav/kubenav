#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

./getcrds.sh

# Create a K3s cluster
docker run \
  -d \
  --tmpfs /run,/var/run \
  --ulimit nproc=65535 \
  --ulimit nofile=65535:65535 \
  --privileged \
  -e K3S_TOKEN=token \
  -e K3S_KUBECONFIG_OUTPUT=/output/kubeconfig.yaml \
  -e K3S_KUBECONFIG_MODE=666 \
  -e K3S_NODE_NAME=homelab-k3s-server \
  -v .:/output \
  -p 6443:6443 \
  --name kubenav-schemas \
  rancher/k3s:v1.35.0-k3s1 server --disable-helm-controller --disable servicelb --disable traefik

sleep 5
export KUBECONFIG=kubeconfig.yaml
sleep 5
kubectl apply --server-side -f crds

# Create a kubectl proxy to access the Kubernetes API of the kind cluster and
# determine the IP address we can use for Docker
nohup kubectl proxy --port=5555 --accept-hosts='^.*' > /dev/null 2>&1 &
KUBECTL_PROXY_PID=$!

sleep 5

# Remove the schemas folder and create it again, then download the OpenAPI
# schema from the Kubernetes API
rm -rf schemas
mkdir -p schemas
curl -vvv http://127.0.0.1:5555/openapi/v2 | jq . >schemas/schema.json

# Stop the 'kubectl proxy' command
kill $KUBECTL_PROXY_PID

# Delete the K3s cluster and the Kubeconfig
docker rm -f kubenav-schemas
rm kubeconfig.yaml

sed -i '' 's|"$ref": "#/definitions/io.k8s.apimachinery.pkg.util.intstr.IntOrString"| "x-kubernetes-int-or-string": true|g' schemas/schema.json
