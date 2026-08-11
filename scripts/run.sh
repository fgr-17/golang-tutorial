#!/usr/bin/env bash
# shellcheck source=common.sh
source "$(dirname "$0")/common.sh"

ensure_in_container "$@"

"$(dirname "$0")/build.sh"
"./${BIN}" "$@"
