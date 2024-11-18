#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
if [ -d "$DOTFILES_DIR/.git" ]; then
   git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master
fi

ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
ln -sfv "$DOTFILES_DIR/runcom/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/runcom/.agignore" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
mkdir -p ~/.aws && ln -sfv ~/Dropbox/settings/aws/config ~/.aws/
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/etc/mackup/.mackup.cfg" ~

# Setup OS
if [ -f "$DOTFILES_DIR/install/osx.sh" ]; then
   . "$DOTFILES_DIR/install/osx.sh"
fi