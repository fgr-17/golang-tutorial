#!/usr/bin/env bash
# shellcheck source=common.sh
source "$(dirname "$0")/common.sh"

ensure_in_container "$@"

require_cmd "${DUPL}" "run: go install github.com/mibk/dupl@latest"
echo "==> dupl -threshold ${DUPL_THRESHOLD}"
"${DUPL}" -threshold "${DUPL_THRESHOLD}" ./cmd ./internal
echo "duplication OK"
