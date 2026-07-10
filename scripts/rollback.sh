#!/usr/bin/env bash
set -euo pipefail

IFS=$'\n\t'

: "${HELM_RELEASE_NAME:?Set HELM_RELEASE_NAME}"
: "${REVISION:?Set REVISION}"

namespace="${K8S_NAMESPACE:-default}"

helm rollback "${HELM_RELEASE_NAME}" "${REVISION}" --namespace "${namespace}"

