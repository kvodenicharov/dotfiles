#!/usr/bin/env zsh
SESSION_NAME="ghostty"
TMUX_PATH="/opt/homebrew/bin/tmux"

# Check if the session already exists and attach or create a new one
if $TMUX_PATH has-session -t "$SESSION_NAME" 2>/dev/null; then
    $TMUX_PATH attach-session -t "$SESSION_NAME"
else
    $TMUX_PATH new-session -s "$SESSION_NAME"
fi
