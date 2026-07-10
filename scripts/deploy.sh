#!/usr/bin/env bash
set -euo pipefail

IFS=$'\n\t'

: "${HELM_RELEASE_NAME:?Set HELM_RELEASE_NAME}"
: "${HELM_CHART_PATH:?Set HELM_CHART_PATH}"

namespace="${K8S_NAMESPACE:-default}"
image_tag="${IMAGE_TAG:-latest}"
values_file="${VALUES_FILE:-values.yaml}"

helm upgrade --install "${HELM_RELEASE_NAME}" "${HELM_CHART_PATH}" \
  --namespace "${namespace}" \
  --create-namespace \
  --values "${values_file}" \
  --set "image.tag=${image_tag}"
