#!/usr/bin/env bash
# shellcheck source=common.sh
source "$(dirname "$0")/common.sh"

ensure_in_container "$@"

mapfile -t sources < <(go_sources)

"${GOFMT}" -w "${sources[@]}"
require_cmd "${GOIMPORTS}" "run: go install golang.org/x/tools/cmd/goimports@latest"
"${GOIMPORTS}" -w "${sources[@]}"
echo "style fixed"
