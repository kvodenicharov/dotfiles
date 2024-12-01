#!/bin/bash

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
FILES_TO_SYMLINK=(
    "nvim:$HOME/.config/nvim"
    ".zshrc:$HOME/.zshrc"
    ".user-aliases:$HOME/.user-aliases"
    ".p10k.zsh:$HOME/.p10k.zsh"
)

# Define colors
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
RESET="\033[0m"

# Function to create a symlink
create_symlink() {
    local source="$1"
    local target="$2"

    if [ ! -e "$source" ]; then
        echo -e "${RED}❌ Error: $source does not exist.${RESET}"
        return 1
    fi

    # Backup if the target already exists
    if [ -L "$target" ]; then
        echo -e "${YELLOW}🔄 Removing existing symlink at $target${RESET}"
        rm "$target"
    elif [ -e "$target" ]; then
        local backup="$target.bak_$(date +%s)"
        echo -e "${YELLOW}📦 Backing up existing $target to $backup${RESET}"
        mv "$target" "$backup"
    fi

    # Create the symlink
    ln -s "$source" "$target"
    echo -e "${GREEN}✅ Symlink created: $source -> $target${RESET}"
}

for entry in "${FILES_TO_SYMLINK[@]}"; do
    IFS=":" read -r source target <<<"$entry"
    create_symlink "$REPO_DIR/$source" "$target"
done
