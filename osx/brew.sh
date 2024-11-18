#!/usr/bin/env bash

# Update Homebrew, formulae, and packages
brew update 
brew upgrade

# Install packages
apps=(
   bash-completion@2
   cmake
   coreutils
   direnv
   docker
   docker-compose
   ag
   git
   mackup
   nvm
   pidof
   pyenv
   tmux
   tmuxinator
   tree
   vim
)

# Install packages
for app in "${apps[@]}"; do
   brew install $app || brew upgrade $app
done

# Additional setup for certain packages
if command -v pyenv 1>/dev/null 2>&1; then
   eval "$(pyenv init -)"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
fi