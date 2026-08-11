#!/usr/bin/env bash
# shellcheck source=common.sh
source "$(dirname "$0")/common.sh"

# shellcheck disable=SC2086
${DOCKER_COMPOSE} up -d
