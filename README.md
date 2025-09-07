# Dev Container Hello World Demo 🐳

A simple Node.js/Express app that demonstrates containerized development environments. Supports both VS Code dev containers and standalone nvim/tmux workflows.

## What This Demonstrates

- **Consistent Environment**: Everyone gets the same Node.js version and dependencies
- **Port Forwarding**: Access your containerized app at `http://localhost:3000`
- **Hot Reload**: Changes to your code automatically restart the server
- **VS Code Integration**: Full IntelliSense, debugging, and extensions inside the container

## Quick Start

### 1. Prerequisites
- Install [OrbStack](https://orbstack.dev), [Colima](https://github.com/abiosoft/colima), or Docker Desktop
- Install [VS Code](https://code.visualstudio.com/)
- Install the **Dev Containers** extension in VS Code

### 2. Clone the Project
```bash
git clone https://github.com/ngkaboon/devcontainertest.git
cd devcontainertest
```

### 3. Open in Dev Container
1. Open the project folder in VS Code
2. VS Code should prompt: **"Reopen in Container"** (click it!)
   - Or manually: `Cmd+Shift+P` → "Dev Containers: Reopen in Container"
3. Wait for the container to build (2-3 minutes first time)
4. VS Code will reload inside the container

### 4. Start the App
In the VS Code terminal (now inside the container):
```bash
npm run dev
```

### 5. View Your App
- Open http://localhost:3000 in your browser
- Click the buttons to test the API endpoints
- Make changes to `server.js` and see them auto-reload!

## Alternative Setup: nvim + tmux

If you prefer using nvim and tmux instead of VS Code, you can use the provided shell script:

### Prerequisites
- Install [OrbStack](https://orbstack.dev), [Colima](https://github.com/abiosoft/colima), or Docker Desktop
- Your favorite terminal and shell setup

### Run the Container
```bash
# Make the script executable and run it
chmod +x dev-container.sh
./dev-container.sh
```

This will:
1. Start a Docker container with Node.js 18
2. Mount your project files to `/workspace`
3. Forward port 3000 to localhost
4. Drop you into a bash shell inside the container

### Inside the Container
```bash
# Run the server 
npm run dev

# Use your preferred editor (vim, nvim, etc.)
# The container includes git and standard development tools
```

Your app will be available at `http://localhost:3000` just like the VS Code setup!

### Automated tmux Setup

For a complete development environment with nvim, container, and Claude Code, use the automated setup:

```bash
# Make the setup script executable and run it
chmod +x dev-setup.sh
./dev-setup.sh
```

This creates a tmux session with:
- **Left pane**: nvim for editing your code
- **Top right**: Docker container shell (runs `./dev-container.sh`)
- **Bottom right**: Claude Code for AI assistance

The session is named "devcontainer" and automatically attaches when ready.

## What's Happening?

**Outside the Container** (your Mac):
- Your files are in a regular folder
- OrbStack/Colima/Docker provides container runtime
- VS Code connects to the container remotely

**Inside the Container** (Ubuntu Linux):
- Node.js 18 is installed
- Your code is mounted as `/workspace`
- The Express server runs on port 3000
- VS Code extensions run inside the container

## Try These Experiments

1. **Edit server.js**: Change the welcome message and save
2. **Add a new endpoint**: Try adding `/api/time` that returns the current time
3. **Install a package**: Run `npm install lodash` in the terminal
4. **Debug**: Set breakpoints and use VS Code's debugger

## Benefits You'll Notice

- **No "works on my machine" issues**: Everyone gets identical environments
- **Faster onboarding**: New team members just open and run
- **Clean host system**: No need to install Node.js versions locally
- **Easy cleanup**: Delete the container when done, no leftovers

## Container Features Included

- **Node.js 18** with npm
- **Git** for version control  
- **VS Code extensions** for better development
- **Auto port forwarding** so localhost:3000 works
- **Automatic npm install** when container starts

## Deployment to Google Cloud Run

This project includes deployment configuration for Google Cloud Run:

### Prerequisites
- Google Cloud account with billing enabled
- [Google Cloud CLI](https://cloud.google.com/sdk/docs/install) installed and authenticated

### Deploy
```bash
# Deploy to your Google Cloud project
./deploy.sh your-project-id

# Or use default project in your gcloud config
./deploy.sh
```

The deployment script will:
1. Build a Docker image from the included Dockerfile
2. Deploy to Cloud Run with auto-scaling (0-10 instances)
3. Enable public access (unauthenticated requests)
4. Configure 512Mi memory and 1 CPU

### Deployment Files
- **Dockerfile**: Multi-stage build for production deployment
- **deploy.sh**: Automated deployment script for Cloud Run
- **.dockerignore**: Excludes unnecessary files from Docker build

## Next Steps

- Try different base images (Python, Go, etc.)
- Add a database with Docker Compose
- Configure custom Dockerfile for specific needs
- Set up pre-commit hooks and linting
- Set up CI/CD pipeline for automated deployments

Happy containerized coding! 🚀
