#!/bin/sh

# Install asdf

# Install vundle for vim

. "$DOTFILES_DIR/install/vundle.sh"

# Set up for colors (solarized) (do after vim!)

# Needs edit to support osx vs linux
. "$DOTFILES_DIR/linux/colors.sh"

# Set up for colors (solarized)

# Depends on asdf
# . "$DOTFILES_DIR/install/ruby.sh"
