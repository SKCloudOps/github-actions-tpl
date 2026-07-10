#!/usr/bin/env bash
set -euo pipefail

IFS=$'\n\t'

: "${GITOPS_REPO_URL:?Set GITOPS_REPO_URL}"
: "${GITOPS_BRANCH:?Set GITOPS_BRANCH}"
: "${IMAGE_TAG:?Set IMAGE_TAG}"

workdir="${WORKDIR:-/tmp/gitops}"
manifest_path="${MANIFEST_PATH:?Set MANIFEST_PATH}"
clone_url="${GITOPS_REPO_URL}"

if [[ -n "${GITOPS_TOKEN:-}" && "${clone_url}" == https://* ]]; then
  clone_url="${clone_url/https:\/\//https:\/\/x-access-token:${GITOPS_TOKEN}@}"
fi

rm -rf "${workdir}"
git clone --branch "${GITOPS_BRANCH}" "${clone_url}" "${workdir}"
cd "${workdir}"

git config user.name "github-actions[bot]"
git config user.email "github-actions[bot]@users.noreply.github.com"

if command -v yq >/dev/null 2>&1; then
  yq -i ".image.tag = \"${IMAGE_TAG}\"" "${manifest_path}"
else
  sed -i.bak -E "s|(tag: ).*$|\1${IMAGE_TAG}|" "${manifest_path}"
fi

git add "${manifest_path}"
if ! git diff --cached --quiet; then
  git commit -m "chore(gitops): promote image ${IMAGE_TAG}"
  git push origin "${GITOPS_BRANCH}"
fi
