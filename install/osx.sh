#!/bin/sh

# Install Homebrew & brew-cask

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install brew & brew-cask packages

. "$DOTFILES_DIR/osx/brew.sh"
. "$DOTFILES_DIR/osx/brew-cask.sh"

# Install bash (with Homebrew)

. "$DOTFILES_DIR/osx/bash.sh"

# Install vundle for vim

. "$DOTFILES_DIR/install/vundle.sh"

# Set up for colors (solarized) (do after vim!)

. "$DOTFILES_DIR/osx/colors.sh"

# Install ruby

. "$DOTFILES_DIR/install/ruby.sh"

# OSX settings

. "$DOTFILES_DIR/osx/defaults.sh"
. "$DOTFILES_DIR/osx/dock.sh"
. "$DOTFILES_DIR/osx/defaults-chrome.sh"
