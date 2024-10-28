#!/usr/bin/env bash

# Update Homebrew, formulae, and packages

brew update
brew upgrade

# Tap petere postgresql to install multiple postgres versions
#    Link: https://medium.com/keeping-code/running-multiple-postgresql-versions-simultaneously-on-macos-linux-90b3d7e08ffd
brew tap petere/postgresql

# Install packages

apps=(
    reattach-to-user-namespace
    bash-completion2
    chruby
    cmake
    coreutils
    dockutil
    direnv
    docker
    docker-compose
    docker-machine
    elixir
    ag
    git
    mackup
    nvm
    pidof
    pyenv
    pyenv-virtualenv
    ruby-install
    tmux
    tmuxinator
    tree
    vim
    nvim
    yarn
    postgresql-common
    postgresql-9.4
    postgresql-9.6
)
# Put postgres last as it is likeliest to run into issues installing

brew install "${apps[@]}"
