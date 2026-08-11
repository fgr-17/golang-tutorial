#!/usr/bin/env bash
# shellcheck source=common.sh
source "$(dirname "$0")/common.sh"

cat <<EOF
Targets (run inside the persistent container automatically):
  build             Compile ${APP} into ${BIN}
  run               Build and print stdout
  test              Run unit tests
  coverage          Run tests with coverage summary
  coverage-html     Write ${COVERAGE_HTML}
  style-check       Check formatting (gofmt + goimports)
  style-fix         Apply formatting (gofmt + goimports)
  lint              Run golangci-lint
  complexity        Cyclomatic complexity (gocyclo)
  duplication       Copy-paste detection (dupl)
  static-analysis   lint + complexity + duplication
  docs              Generate API docs with gomarkdoc
  tidy              go mod tidy
  clean             Remove build artifacts

Container lifecycle:
  docker-build      Build the Docker image
  docker-up         Start the persistent container
  docker-shell      Interactive bash in the container
  docker-run        Alias for make run
  docker-make ARGS='...'  Run make targets inside the container
EOF
