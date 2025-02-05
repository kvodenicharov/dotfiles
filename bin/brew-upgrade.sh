#!/bin/bash

# Text formatting
BOLD='\033[1m'
NORMAL='\033[0m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'

print_header() {
    echo -e "\n${BOLD}${BLUE}$1${NORMAL}"
}

print_package() {
    echo -e "${BOLD}${GREEN}$1${NORMAL}"
}

# Get list of outdated packages
print_header "Checking for outdated packages..."
outdated_packages=$(brew outdated --verbose)

if [ -z "$outdated_packages" ]; then
    echo "No packages to upgrade!"
    exit 0
fi

# Show outdated packages and their versions
echo -e "\nOutdated packages:"
echo "$outdated_packages"

# Ask for confirmation
echo -e "\nWould you like to see the changelogs before upgrading? (y/n)"
read -r response

if [[ "$response" =~ ^[Yy]$ ]]; then
    # Process each package
    while IFS= read -r line; do
        # Extract package name (everything before first space)
        package=$(echo "$line" | cut -d' ' -f1)

        if [ -n "$package" ]; then
            print_package "\nChangelog for $package:"

            # Try to get GitHub releases first
            gh_url=$(brew info --json=v2 "$package" | jq -r '.[].formula.homepage' | grep 'github.com')

            if [ -n "$gh_url" ]; then
                # Show last 3 releases from GitHub
                echo "Recent releases from GitHub:"
                curl -s "$(echo "$gh_url" | sed 's/github.com/api.github.com\/repos/')/releases" |
                    jq -r '.[:3] | .[] | "\nVersion: \(.tag_name)\nRelease date: \(.published_at)\n\(.body)\n"'
            else
                # Fallback to brew log
                brew log "$package" | head -n 20
            fi

            echo -e "\n----------------------------------------"
        fi
    done <<<"$outdated_packages"
fi

# Ask if user wants to proceed with upgrade
echo -e "\nWould you like to proceed with the upgrade? (y/n)"
read -r upgrade_response

if [[ "$upgrade_response" =~ ^[Yy]$ ]]; then
    print_header "Proceeding with upgrade..."
    brew upgrade
else
    print_header "Upgrade cancelled"
fi
