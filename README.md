# Local AI — Ollama + Open WebUI

Local AI stack powered by Ollama, Docker Compose and NVIDIA GPU.

Requirements: Docker, Docker Compose, NVIDIA drivers and NVIDIA Container Toolkit.

## Start

```bash
cp .env.template .env
```

Paste the generated key into `WEBUI_SECRET_KEY` in `.env`.

```bash
docker compose up -d
```

Open http://localhost:3000

## Models

Browse available models: https://ollama.com/search

Recommended model: `qwen3.5:9b`

Download models manually. They are stored locally in a persistent Docker volume.

```bash
# Download
docker exec -it local-ai ollama pull qwen2.5-coder:14b
```

```bash
# List
docker exec local-ai ollama list
```

```bash
# Remove
docker exec local-ai ollama rm MODEL_NAME
```

## Commands

```bash
# Start
docker compose up -d

# Stop
docker compose down

# Logs
docker compose logs -f

# Status
docker compose ps

# Update containers
docker compose pull
docker compose up -d
```

```bash
# Hard reset
docker system prune --volumes
```

## Data

Models, chats and settings are stored in persistent Docker volumes. 

`docker compose down` keeps your data.

Do not use `docker compose down -v` unless you want to delete your data.

Avoid `docker system prune --volumes` unless you intend to remove unused Docker volumes.

## Links

- Ollama: https://ollama.com/
- Model library: https://ollama.com/search
- Open WebUI: https://docs.openwebui.com/
