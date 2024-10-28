#!/usr/bin/env bash

apps=(
    1password
    dropbox
    firefox
    google-chrome
    iterm2
    spectacle
    spotify
    slack
    vlc
    virtualbox
    visual-studio-code
    whatsapp
)

brew cask install "${apps[@]}"
