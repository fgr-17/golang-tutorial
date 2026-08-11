#!/usr/bin/env bash
# shellcheck source=common.sh
source "$(dirname "$0")/common.sh"

ensure_in_container "$@"

require_cmd "${GOMARKDOC}" "run: go install github.com/princjef/gomarkdoc/cmd/gomarkdoc@latest"
mkdir -p "${DOCS_DIR}"
"${GOMARKDOC}" --output "${DOCS_DIR}/{{.Dir}}.md" ./...
echo "docs written under ${DOCS_DIR}/"
