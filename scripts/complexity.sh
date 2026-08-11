#!/usr/bin/env bash
# shellcheck source=common.sh
source "$(dirname "$0")/common.sh"

ensure_in_container "$@"

require_cmd "${GOCYCLO}" "run: go install github.com/fzipp/gocyclo/cmd/gocyclo@latest"
echo "==> gocyclo -over ${CYCLO_OVER}"
"${GOCYCLO}" -over "${CYCLO_OVER}" ./cmd ./internal
echo "complexity OK"
