# Dev Container Hello World Demo 🐳

A simple Node.js/Express app that demonstrates how to use VS Code dev containers with OrbStack on Mac.

## What This Demonstrates

- **Consistent Environment**: Everyone gets the same Node.js version and dependencies
- **Port Forwarding**: Access your containerized app at `http://localhost:3000`
- **Hot Reload**: Changes to your code automatically restart the server
- **VS Code Integration**: Full IntelliSense, debugging, and extensions inside the container

## Quick Start

### 1. Prerequisites
- Install [OrbStack](https://orbstack.dev) (or Docker Desktop)
- Install [VS Code](https://code.visualstudio.com/)
- Install the **Dev Containers** extension in VS Code

### 2. Setup Project
Create a new folder and add these files:
```
my-devcontainer-app/
├── .devcontainer/
│   └── devcontainer.json
├── public/
│   └── index.html
├── package.json
├── server.js
└── README.md
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

## What's Happening?

**Outside the Container** (your Mac):
- Your files are in a regular folder
- OrbStack provides Docker compatibility
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

## Next Steps

- Try different base images (Python, Go, etc.)
- Add a database with Docker Compose
- Configure custom Dockerfile for specific needs
- Set up pre-commit hooks and linting

Happy containerized coding! 🚀
