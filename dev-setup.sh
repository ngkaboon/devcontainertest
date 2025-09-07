#!/bin/bash
# dev-setup.sh with specific layout

SESSION_NAME="devcontainer"
tmux kill-session -t $SESSION_NAME 2>/dev/null

# Create session and window
tmux new-session -d -s $SESSION_NAME

# Split vertically (editor | container)
tmux split-window -h

# Left pane: Neovim
tmux select-pane -t 0
tmux send-keys 'nvim .' Enter

# Right pane: Split horizontally (container shell on top, claude on bottom)
tmux select-pane -t 1
tmux split-window -v -p 70
tmux send-keys -t 1 './dev-container.sh' Enter

# Bottom right: Run Claude
tmux select-pane -t 2
tmux send-keys 'claude' Enter

# Start on editor pane
tmux select-pane -t 0
tmux attach -t $SESSION_NAME
