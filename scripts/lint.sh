#!/usr/bin/env bash
# shellcheck source=common.sh
source "$(dirname "$0")/common.sh"

ensure_in_container "$@"

require_cmd "${GOLANGCI_LINT}" "use Docker or install from https://golangci-lint.run"
GOFLAGS="${GO_BUILDFLAGS}" "${GOLANGCI_LINT}" run ./...
