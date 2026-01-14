#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

rm -rf crds
mkdir crds

# Argo CD
curl -L -o crds/argocd-application.yaml https://raw.githubusercontent.com/argoproj/argo-cd/refs/tags/v3.2.3/manifests/crds/application-crd.yaml
curl -L -o crds/argocd-applicationset.yaml https://raw.githubusercontent.com/argoproj/argo-cd/refs/tags/v3.2.3/manifests/crds/applicationset-crd.yaml
curl -L -o crds/argocd-appproject.yaml https://raw.githubusercontent.com/argoproj/argo-cd/refs/tags/v3.2.3/manifests/crds/appproject-crd.yaml

# cert-manager
curl -L -o crds/cert-manager.yaml https://github.com/cert-manager/cert-manager/releases/download/v1.19.1/cert-manager.crds.yaml

# Flux
# See https://github.com/fluxcd/flux2/blob/v2.6.4/manifests/crds/kustomization.yaml
curl -L -o crds/flux-source-controller.yaml https://github.com/fluxcd/source-controller/releases/download/v1.7.4/source-controller.crds.yaml
curl -L -o crds/flux-kustomize-controller.yaml https://github.com/fluxcd/kustomize-controller/releases/download/v1.7.3/kustomize-controller.crds.yaml
curl -L -o crds/flux-helm-controller.yaml https://github.com/fluxcd/helm-controller/releases/download/v1.4.5/helm-controller.crds.yaml
curl -L -o crds/flux-notification-controller.yaml https://github.com/fluxcd/notification-controller/releases/download/v1.7.5/notification-controller.crds.yaml
curl -L -o crds/flux-image-reflector-controller.yaml https://github.com/fluxcd/image-reflector-controller/releases/download/v1.0.4/image-reflector-controller.crds.yaml
curl -L -o crds/flux-image-automation-controller.yaml https://github.com/fluxcd/image-automation-controller/releases/download/v1.0.4/image-automation-controller.crds.yaml
