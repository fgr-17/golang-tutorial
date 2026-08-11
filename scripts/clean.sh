#!/usr/bin/env bash
# shellcheck source=common.sh
source "$(dirname "$0")/common.sh"

ensure_in_container "$@"

rm -rf "${BIN_DIR}" "${COVERAGE_OUT}" "${COVERAGE_HTML}" "${DOCS_DIR}"
