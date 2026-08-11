#!/usr/bin/env bash
# shellcheck source=common.sh
source "$(dirname "$0")/common.sh"

ensure_in_container "$@"

"$(dirname "$0")/coverage.sh"
"${GO}" tool cover -html="${COVERAGE_OUT}" -o "${COVERAGE_HTML}"
echo "Wrote ${COVERAGE_HTML}"
