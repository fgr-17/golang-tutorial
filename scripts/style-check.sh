#!/usr/bin/env bash
# shellcheck source=common.sh
source "$(dirname "$0")/common.sh"

ensure_in_container "$@"

mapfile -t sources < <(go_sources)

echo "==> gofmt -l"
unformatted="$("${GOFMT}" -l "${sources[@]}")"
if [[ -n "${unformatted}" ]]; then
  echo "gofmt needed on:"
  echo "${unformatted}"
  exit 1
fi

echo "==> goimports -l"
require_cmd "${GOIMPORTS}" "run: go install golang.org/x/tools/cmd/goimports@latest"
unimported="$("${GOIMPORTS}" -l "${sources[@]}")"
if [[ -n "${unimported}" ]]; then
  echo "goimports needed on:"
  echo "${unimported}"
  exit 1
fi

echo "style OK"
