#!/bin/bash
# dev-container.sh
docker run -it --rm \
  --name hello-dev \
  -v $(pwd):/workspace \
  -w /workspace \
  -p 3000:3000 \
  mcr.microsoft.com/devcontainers/base:ubuntu bash -c "
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install && \
    exec bash
  "
