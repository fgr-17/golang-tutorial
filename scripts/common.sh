#!/usr/bin/env bash
# Shared defaults for go-template scripts. Source from other scripts.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

APP="${APP:-hello}"
MODULE="${MODULE:-github.com/fgr-17/go-template}"
CMD_PKG="${CMD_PKG:-./cmd/hello}"
BIN_DIR="${BIN_DIR:-bin}"
BIN="${BIN:-${BIN_DIR}/${APP}}"

COVERAGE_OUT="${COVERAGE_OUT:-coverage.out}"
COVERAGE_HTML="${COVERAGE_HTML:-coverage.html}"
DOCS_DIR="${DOCS_DIR:-docs/api}"

GO="${GO:-go}"
GOFMT="${GOFMT:-gofmt}"
GOIMPORTS="${GOIMPORTS:-goimports}"
GOLANGCI_LINT="${GOLANGCI_LINT:-golangci-lint}"
GOCYCLO="${GOCYCLO:-gocyclo}"
DUPL="${DUPL:-dupl}"
GOMARKDOC="${GOMARKDOC:-gomarkdoc}"

# Avoid VCS stamp failures inside Docker bind mounts. Do not export globally:
# tools like gomarkdoc forward GOFLAGS and reject -buildvcs.
GO_BUILDFLAGS="${GO_BUILDFLAGS:--buildvcs=false}"

CYCLO_OVER="${CYCLO_OVER:-10}"
DUPL_THRESHOLD="${DUPL_THRESHOLD:-50}"

DOCKER_SERVICE="${DOCKER_SERVICE:-go-template}"

# Prefer Compose V2 plugin; fall back to legacy docker-compose.
if [[ -n "${DOCKER_COMPOSE:-}" ]]; then
  :
elif command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
  DOCKER_COMPOSE="docker compose"
elif command -v docker-compose >/dev/null 2>&1; then
  DOCKER_COMPOSE="docker-compose"
else
  DOCKER_COMPOSE="docker compose"
fi

go_sources() {
  find . -name '*.go' -not -path './vendor/*' -not -path './.git/*'
}

require_cmd() {
  local cmd="$1"
  local hint="${2:-}"
  if ! command -v "${cmd}" >/dev/null 2>&1; then
    echo "${cmd} not found${hint:+; ${hint}}" >&2
    exit 1
  fi
}

in_container() {
  [[ "${GO_TEMPLATE_IN_CONTAINER:-}" == "1" ]] || [[ -f /.dockerenv ]]
}

# Re-run the calling script's make target inside the persistent container when
# invoked from the host. No-op when already inside the container.
ensure_in_container() {
  if in_container; then
    return 0
  fi

  local caller="${BASH_SOURCE[1]:-}"
  local target
  target="$(basename "${caller}" .sh)"

  case "${target}" in
    docker-*|help|common|"")
      return 0
      ;;
  esac

  "${ROOT_DIR}/scripts/docker-up.sh"
  exec docker exec -t -e GO_TEMPLATE_IN_CONTAINER=1 "${DOCKER_SERVICE}" make "${target}" "$@"
}
