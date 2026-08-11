#!/usr/bin/env bash
# shellcheck source=common.sh
source "$(dirname "$0")/common.sh"

"$(dirname "$0")/docker-up.sh"
docker exec -it "${DOCKER_SERVICE}" bash
