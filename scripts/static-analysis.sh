#!/usr/bin/env bash
# shellcheck source=common.sh
source "$(dirname "$0")/common.sh"

ensure_in_container "$@"

"$(dirname "$0")/lint.sh"
"$(dirname "$0")/complexity.sh"
"$(dirname "$0")/duplication.sh"
echo "static-analysis OK"
