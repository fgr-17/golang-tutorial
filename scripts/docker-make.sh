#!/usr/bin/env bash
# shellcheck source=common.sh
source "$(dirname "$0")/common.sh"

"$(dirname "$0")/docker-up.sh"
docker exec -t -e GO_TEMPLATE_IN_CONTAINER=1 "${DOCKER_SERVICE}" make "$@"
