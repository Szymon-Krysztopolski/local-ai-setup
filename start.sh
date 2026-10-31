
#!/usr/bin/env bash
set -Eeuo pipefail

# Build the agent image, without starting the agent
docker compose build coding-agent

# Start Ollama and Open WebUI
docker compose up -d

echo "Local AI stack is running."
echo "Open WebUI: http://localhost:${OPEN_WEBUI_PORT:-3000}"
