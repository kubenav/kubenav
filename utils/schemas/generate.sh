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

# Generate JSON schemas for all Kubernetes resources and
# CustomResourceDefinitions (CRDs) of the kind cluster and store them in the
# 'schemas' directory
rm -rf schemas
mkdir -p schemas

OPENAPI2JSONSCHEMABIN="./openapi2jsonschema.py"
SCHEMA=http://127.0.0.1:5555/openapi/v2

$OPENAPI2JSONSCHEMABIN "schemas" "${SCHEMA}"

# Stop the 'kubectl proxy' command
kill $KUBECTL_PROXY_PID

# Delete the K3s cluster and the Kubeconfig
docker rm -f kubenav-schemas
rm kubeconfig.yaml

rm -rf ../../lib/models/kubernetes
mkdir -p ../../lib/models/kubernetes

# Convert the JSON schemas to Dart models, only for list types
for f in schemas/*.json ; do
  mv "$f" "$(echo "$f" | sed s/-/_/g)"
done

for f in schemas/*.json ; do
  if [[ $f == *"list"* ]]; then
    echo "Process $f"
    dartfile=$(echo "$f" | sed s/schemas/kubernetes/ | sed s/json/dart/)
    npx quicktype --src $f --src-lang schema --out ../../lib/models/$dartfile --lang dart --null-safety --coders-in-class --use-json-annotation
  fi
done

rm -rf crds
rm -rf schemas

cd ../..

dart run build_runner build -v
dart format ./lib/models/kubernetes
dart fix --apply ./lib/models/kubernetes
