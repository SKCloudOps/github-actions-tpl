#!/usr/bin/env bash
set -euo pipefail

IFS=$'\n\t'

: "${SMOKE_TEST_URL:?Set SMOKE_TEST_URL}"

retries="${SMOKE_TEST_RETRIES:-10}"
delay_seconds="${SMOKE_TEST_DELAY_SECONDS:-5}"

for attempt in $(seq 1 "${retries}"); do
  if curl -fsS "${SMOKE_TEST_URL}" >/dev/null; then
    printf '[smoke-test] success on attempt %s\n' "${attempt}"
    exit 0
  fi

  printf '[smoke-test] attempt %s failed\n' "${attempt}" >&2
  sleep "${delay_seconds}"
done

printf '[smoke-test] service did not become healthy: %s\n' "${SMOKE_TEST_URL}" >&2
exit 1

