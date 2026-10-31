#!/usr/bin/env bash
set -Eeuo pipefail

PROJECT_DIR="$(realpath "${1:-.}")"

if [[ ! -d "$PROJECT_DIR" ]]; then
    echo "Error: Project directory does not exist: $PROJECT_DIR"
    exit 1
fi

docker compose --profile agent run \
    --rm \
    --user "$(id -u):$(id -g)" \
    --volume "$PROJECT_DIR:/workspace" \
    --workdir /workspace \
    coding-agent \
    /workspace
