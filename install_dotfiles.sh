#!/bin/bash

# Script to install dotfiles on a new computer
# This script copies configuration files from the dotfiles repository
# to their appropriate locations on the system

# Define source directory (where this script is located)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create necessary directories
mkdir -p "$HOME/.config/fish"
mkdir -p "$HOME/.config/karabiner/assets/complex_modifications"

# List of files to install
dotfiles=(
    "$DOTFILES_DIR/config.fish:$HOME/.config/fish/config.fish"
    "$DOTFILES_DIR/.mertrc:$HOME/.mertrc"
    "$DOTFILES_DIR/iTerm2_arn0.json:$HOME/Library/Preferences/com.googlecode.iterm2.plist"
    "$DOTFILES_DIR/karabiner/karabiner.json:$HOME/.config/karabiner/karabiner.json"
    "$DOTFILES_DIR/karabiner/complex_modifications/1740046319.json:$HOME/.config/karabiner/assets/complex_modifications/1740046319.json"
)

# Function to install a file
install_file() {
    local source="$1"
    local dest="$2"
    
    # Create destination directory if needed
    mkdir -p "$(dirname "$dest")"
    
    if [ -f "$source" ]; then
        echo "Installing $source to $dest"
        cp "$source" "$dest"
    else
        echo "Warning: $source does not exist"
    fi
}

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "Warning: This script is designed for macOS"
    exit 1
fi

# Install each file
for file_pair in "${dotfiles[@]}"; do
    source="${file_pair%%:*}"
    dest="${file_pair#*:}"
    install_file "$source" "$dest"
done

# Restart services if needed
echo "Installation completed!"
echo "For changes to take effect, you may need to:"
echo "1. Restart iTerm2"
echo "2. Restart Karabiner-Elements"
echo "3. Restart your shell (fish)" 