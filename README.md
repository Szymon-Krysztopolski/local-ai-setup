# Local AI — Ollama, Open WebUI & OpenCode

Local AI environment powered by Docker Compose, Ollama and NVIDIA GPU.

## Requirements

- Docker Engine
- Docker Compose v2
- NVIDIA drivers and NVIDIA Container Toolkit

## Configuration

```bash
cp .env.template .env
```

Set `WEBUI_SECRET_KEY` in `.env`.

## Start

```bash
# Start Ollama and Open WebUI
docker compose up -d
```

Run the agent command from the repository you want to work on. The agent uses that directory as its workspace.

Open WebUI: http://localhost:3000

## Models

Browse models: https://ollama.com/search

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

## OpenCode

Build the agent image once:

```bash
docker compose --profile agent build coding-agent
```

Run OpenCode in the current repository:

```bash
docker compose --profile agent run --rm --no-deps \
  --entrypoint opencode \
  --user "$(id -u):$(id -g)" \
  -v "$PWD:/workspace" \
  -w /workspace \
  coding-agent
```

To use another repository, replace `$PWD` with its absolute path.

The agent uses shared configuration, skills, agents and MCP servers from `opencode/`.

Each session runs in a temporary container. Ollama and Open WebUI remain running in the background.

## Commands

```bash
# Stop the stack
docker compose --profile agent down
```

```bash
# Logs
docker compose logs -f
```

```bash
# View running containers
docker compose ps
```

## Data

- Ollama models and Open WebUI data are stored in persistent Docker volumes.
- `docker compose down` preserves volumes.
- `docker compose down -v` deletes volumes and their data.
- OpenCode configuration is stored in `opencode/`.
- Temporary OpenCode session history is not persisted by default.

## Links

- [Ollama](https://ollama.com/)
- [Open WebUI](https://docs.openwebui.com/)
- [OpenCode](https://opencode.ai/docs/)
- [OpenCode Skills](https://opencode.ai/docs/skills/)
- [OpenCode MCP](https://opencode.ai/docs/mcp-servers/)
