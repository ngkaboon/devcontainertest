#!/bin/bash
# dev-container.sh
docker run -it --rm \
  --name hello-dev \
  -v $(pwd):/workspace \
  -w /workspace \
  -p 3000:3000 \
  -p 8080:8080 \
  mcr.microsoft.com/devcontainers/base:ubuntu bash -c "
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    chown -R vscode:vscode /workspace && \
    npm install && \
    su -c 'cd /workspace && bash' vscode
  "
