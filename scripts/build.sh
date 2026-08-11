#!/usr/bin/env bash
# shellcheck source=common.sh
source "$(dirname "$0")/common.sh"

ensure_in_container "$@"

mkdir -p "${BIN_DIR}"
"${GO}" build ${GO_BUILDFLAGS} -o "${BIN}" "${CMD_PKG}"
