FROM node:22-bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       ca-certificates \
       git \
       openssh-client \
       bash \
       curl \
       python3 \
       make \
       g++ \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g opencode-ai

WORKDIR /workspace

ENTRYPOINT ["opencode"]
