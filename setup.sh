#!/bin/bash

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
NVIM_SRC_DIR="$REPO_DIR/nvim"
NVIM_DEST_DIR="$HOME/.config/nvim"

# Define colors
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
RESET="\033[0m"

# Backup existing ~/.config/nvim if it exists
if [ -L "$NVIM_DEST_DIR" ]; then
    echo -e "${YELLOW}🔄 Removing existing symlink at $NVIM_DEST_DIR${RESET}"
    rm "$NVIM_DEST_DIR"
elif [ -d "$NVIM_DEST_DIR" ]; then
    BACKUP_DIR="$HOME/.config/nvim.bak_$(date +%s)"
    echo -e "${YELLOW}📦 Backing up existing $NVIM_DEST_DIR to $BACKUP_DIR${RESET}"
    mv "$NVIM_DEST_DIR" "$BACKUP_DIR"
fi

ln -s "$NVIM_SRC_DIR" "$NVIM_DEST_DIR"
echo -e "${GREEN}✅ Symlink created: $NVIM_SRC_DIR -> $NVIM_DEST_DIR${RESET}"
