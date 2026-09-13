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
  rancher/k3s:v1.36.0-k3s1 server --disable-helm-controller --disable servicelb --disable traefik

sleep 5
export KUBECONFIG=kubeconfig.yaml
sleep 5
kubectl apply --server-side -f crds

# Wait until all CRDs are "Established" before fetching the schema. A successful
# "kubectl apply" only means the CRDs are stored, not that their schemas have
# been aggregated into the OpenAPI document. The API server merges each CRD's
# schema into "/openapi/v2" asynchronously, once the CRD becomes Established, so
# fetching too early yields a spec that is missing (some of) the CRD
# definitions, which later breaks the generated Dart code.
kubectl wait --for=condition=Established --all crd --timeout=120s

# Remove the schemas folder and create it again, then download the OpenAPI
# schema from the Kubernetes API. We retry until the endpoint returns a
# non-empty document instead of relying on a fixed sleep, which caused
# "curl: (52) Empty reply from server" errors.
rm -rf schemas
mkdir -p schemas

for i in $(seq 1 30); do
  if kubectl get --raw /openapi/v2 | jq . >schemas/schema.json 2>/dev/null && [ -s schemas/schema.json ]; then
    break
  fi
  echo "openapi/v2 not ready yet, retrying (${i})..."
  sleep 2
done

# Delete the K3s cluster and the Kubeconfig
docker rm -f kubenav-schemas
rm kubeconfig.yaml

sed -i '' 's|"$ref": "#/definitions/io.k8s.apimachinery.pkg.util.intstr.IntOrString"| "x-kubernetes-int-or-string": true|g' schemas/schema.json
