# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Node.js/Express demo application that showcases containerized development environments. It supports both VS Code dev containers and a standalone nvim/tmux setup via a shell script.

## Architecture

- **Express Server** (`server.js`): Simple web server with static file serving and REST API endpoints
- **Static Frontend** (`public/index.html`): Single-page HTML application with JavaScript for testing API endpoints
- **Dev Container Configuration** (`.devcontainer/devcontainer.json`): VS Code dev container setup with Node.js 18 and development extensions
- **Standalone Container Script** (`dev-container.sh`): Manual Docker setup for nvim/tmux development workflow

## Development Commands

### Running the Application
```bash
# Start the server with auto-restart on file changes
npm run dev

# Start the server in production mode
npm start
```

## Development Environment Options

### Option 1: VS Code Dev Container
- Open in VS Code and use "Reopen in Container"
- Automatic setup with Node.js 18, extensions, and port forwarding
- Port 3000 automatically forwarded to localhost

### Option 2: Standalone Container (nvim/tmux setup)
```bash
# Run the container with nvim/tmux environment
./dev-container.sh
```
- Manual Docker container with Node.js 18
- Suitable for nvim + tmux development workflow
- Mounts current directory to `/workspace`
- Port 3000 mapped to localhost

## API Endpoints

- `GET /api/hello` - Returns welcome message with timestamp and environment
- `GET /api/health` - Returns server health status and uptime
- Static files served from `public/` directory at root path

## Key Technologies

- **Runtime**: Node.js 18
- **Framework**: Express.js 4.18.x
- **Development**: nodemon for auto-restart
- **Container**: Ubuntu-based container with dual IDE support (VS Code or nvim/tmux)