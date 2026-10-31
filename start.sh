
#!/bin/sh
set -eu

cd "$(dirname "$0")"

if [ ! -f .env ]; then
  echo "Brak pliku .env!"
  exit 1
fi

set -a
. ./.env
set +a

echo "Starting Ollama..."
docker compose up -d local-ai

echo "Downloading model..."
docker compose exec -T local-ai \
  ollama pull "${OLLAMA_MODEL}"

echo "Starting OpenCode..."
docker compose --profile agent run --rm coding-agent
