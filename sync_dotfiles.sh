#!/bin/bash

# Script to sync dotfiles
# This script copies configuration files from your home directory
# to the dotfiles repository

# Define destination directory (where this script is located)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create karabiner directory if it doesn't exist
mkdir -p "$DOTFILES_DIR/karabiner"

# List of files to sync
dotfiles=(
    "$HOME/.config/fish/config.fish:$DOTFILES_DIR/config.fish"
    "$HOME/.mertrc:$DOTFILES_DIR/.mertrc"
    "$HOME/Library/Preferences/com.googlecode.iterm2.plist:$DOTFILES_DIR/iTerm2_arn0.json"
    "$HOME/.config/karabiner/karabiner.json:$DOTFILES_DIR/karabiner/karabiner.json"
    "$HOME/.config/karabiner/assets/complex_modifications/1740046319.json:$DOTFILES_DIR/karabiner/complex_modifications/1740046319.json"
)

# Function to copy a file
copy_file() {
    local source="$1"
    local dest="$2"
    
    # Create destination directory if needed
    mkdir -p "$(dirname "$dest")"
    
    if [ -f "$source" ]; then
        echo "Copying $source to $dest"
        cp "$source" "$dest"
    else
        echo "Warning: $source does not exist"
    fi
}

# Copy each file
for file_pair in "${dotfiles[@]}"; do
    source="${file_pair%%:*}"
    dest="${file_pair#*:}"
    copy_file "$source" "$dest"
done

echo "Sync completed!" 