#!/usr/bin/env bash

# Set strict error handling
set -euo pipefail

# Text formatting
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Helper functions for pretty printing
print_header() {
    echo -e "\n${BOLD}$1${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}! $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Homebrew if not present (macOS only)
install_homebrew() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if ! command_exists brew; then
            print_header "Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            print_success "Homebrew installed successfully!"
        fi
    fi
}

# Install stow if not present
install_stow() {
    if ! command_exists stow; then
        print_header "Installing GNU Stow..."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            brew install stow
        elif command_exists apt-get; then
            sudo apt-get update && sudo apt-get install -y stow
        elif command_exists dnf; then
            sudo dnf install -y stow
        elif command_exists yay; then
            sudo yay -y stow
        else
            print_error "Could not install stow. Please install it manually."
            exit 1
        fi
        print_success "GNU Stow installed successfully!"
    fi
}

# Check for brew packages file and suggest installation
check_brew_packages() {
    local brew_packages_file=".os/macos/brew_packages.txt"
    if [[ -f "$brew_packages_file" ]]; then
        print_header "Homebrew packages"
        echo "Found brew packages file at $brew_packages_file"
        echo -e "Would you like to install the recommended packages? [y/N] "
        read -r response
        if [[ "$response" =~ ^[Yy]$ ]]; then
            while IFS= read -r package || [[ -n "$package" ]]; do
                # Skip empty lines and comments
                [[ -z "$package" || "$package" =~ ^# ]] && continue
                if ! brew list "$package" &>/dev/null; then
                    echo "Installing $package..."
                    brew install "$package"
                else
                    echo "$package already installed."
                fi
            done <"$brew_packages_file"
            print_success "Brew packages installation complete!"
        else
            print_warning "Skipping brew packages installation."
            echo "You can install them later with: brew install \$(cat $brew_packages_file)"
        fi
    fi
}

# Create symlinks using stow
setup_symlinks() {
    print_header "Setting up dotfiles symlinks..."

    # Use stow to create symlinks
    if stow -v -R -d . -t ~ .; then
        print_success "Dotfiles linked successfully!"
        if [[ -d "$backup_dir" && "$(ls -A "$backup_dir")" ]]; then
            print_warning "Original dotfiles were backed up to: $backup_dir"
        fi
    else
        print_error "Error linking dotfiles!"
        exit 1
    fi
}

# Setup secret files that shouldn't be in version control
setup_secret_files() {
    print_header "Setting up secret files..."
    local secret_files=(
        "$HOME/.user-secrets"
        "$HOME/.gitconfig-secrets"
    )

    for file in "${secret_files[@]}"; do
        if [[ ! -f "$file" ]]; then
            touch "$file"
            # Set restrictive permissions for security
            chmod 600 "$file"
            print_success "Created $file with secure permissions"

            # Add helpful comments to the files
            case "$file" in
            */.user-secrets)
                echo "# Add your sensitive environment variables here" >"$file"
                echo "# Example:" >>"$file"
                echo "# export API_KEY='your-secret-key'" >>"$file"
                ;;
            */.gitconfig-secrets)
                echo "# Add your sensitive git configurations here" >"$file"
                echo "# Example:" >>"$file"
                echo "# [user]" >>"$file"
                echo "#     email = work@company.com" >>"$file"
                echo "#     signingkey = GPGKEY" >>"$file"
                ;;
            esac
        else
            print_warning "$file already exists, skipping..."
        fi
    done
}

# Main installation process
main() {
    clear
    echo -e "${BOLD}Dotfiles Installation Script${NC}"
    echo "This script will set up your dotfiles and install necessary dependencies."
    echo "Run this script at your own risk. It is highly opinionated and will replace a lot of your existing configuration."
    echo -e "Press ${BOLD}Enter${NC} to continue or ${BOLD}Ctrl+C${NC} to abort..."
    read -r

    # Check system and install dependencies
    if [[ "$OSTYPE" == "darwin"* ]]; then
        install_homebrew
        check_brew_packages
    fi

    install_stow
    setup_secret_files
    setup_symlinks

    print_header "Installation Complete!"
    echo "Your dotfiles have been set up successfully."
    echo "You may need to restart your terminal for all changes to take effect."
}

# Run the script
main
