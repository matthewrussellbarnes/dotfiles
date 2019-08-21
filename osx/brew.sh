#!/usr/bin/env bash

# Update Homebrew, formulae, and packages

brew update
brew upgrade

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
    pidof
    pyenv
    ruby-install
    tmux
    tree
    vim
)

brew install "${apps[@]}"
