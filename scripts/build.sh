#!/usr/bin/env bash
set -euo pipefail

IFS=$'\n\t'

usage() {
  cat <<'EOF'
Usage: build.sh [language] [working-directory]

Examples:
  build.sh java .
  build.sh react apps/web
EOF
}

log() {
  printf '[build] %s\n' "$*"
}

language="${1:-java}"
working_directory="${2:-.}"

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [[ ! -d "${working_directory}" ]]; then
  printf '[build] working directory not found: %s\n' "${working_directory}" >&2
  exit 1
fi

cd "${working_directory}"

case "${language}" in
  java)
    log "running Java build"
    if [[ -x "./mvnw" ]]; then
      ./mvnw -B clean verify
    else
      mvn -B clean verify
    fi
    ;;
  react)
    log "running React build"
    npm ci
    npm run build
    ;;
  *)
    printf '[build] unsupported language: %s\n' "${language}" >&2
    exit 1
    ;;
esac

log "build completed"

