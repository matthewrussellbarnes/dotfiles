#!/usr/bin/env bash

# Exit on error, undefined variable, or pipe failure
set -euo pipefail

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew is not installed. Please install it first."
    echo "Visit: https://brew.sh"
    exit 1
fi

echo "Installing latest version of bash..."
brew install bash

# Get the path to the Homebrew-installed bash
BREW_BASH="$(brew --prefix)/bin/bash"

# Check if the Homebrew bash is already in /etc/shells
if ! grep -q "^${BREW_BASH}$" /etc/shells; then
    echo "Adding ${BREW_BASH} to /etc/shells..."
    echo "${BREW_BASH}" | sudo tee -a /etc/shells
fi

# Change the shell
echo "Changing default shell to Homebrew bash..."
chsh -s "${BREW_BASH}"

echo "Shell updated successfully! Please restart your terminal."
echo "Verify your shell with: echo \$SHELL"