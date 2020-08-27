#!/usr/bin/env bash

apps=(
    1password
    anki
    discord
    dropbox
    evernote
    firefox
    google-chrome
    iterm2
    spectacle
    karabiner-elements
    signal
    slack
    spotify
    slack
    virtualbox
    visual-studio-code
    vlc
    whatsapp
)

brew cask install "${apps[@]}"
