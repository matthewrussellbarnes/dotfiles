#!/bin/sh

# Install Homebrew (new installation command)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# The following lines are outdated and should be removed:
# brew tap caskroom/cask        # No longer needed
# brew install brew-cask        # No longer needed
# brew tap caskroom/versions    # No longer needed

# Casks are now integrated into Homebrew directly
# You can just use 'brew install --cask' for applications

# Source other scripts (assuming these files exist)
if [ -n "$DOTFILES_DIR" ]; then
    . "$DOTFILES_DIR/osx/brew.sh"
    . "$DOTFILES_DIR/osx/brew-cask.sh"
    . "$DOTFILES_DIR/osx/bash.sh"
    . "$DOTFILES_DIR/osx/defaults.sh"
    . "$DOTFILES_DIR/osx/defaults-chrome.sh"
else
    echo "Error: DOTFILES_DIR is not set"
    exit 1
fi