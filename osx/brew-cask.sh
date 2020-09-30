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
    mendeley
    signal
    slack
    spotify
    slack
    private-internet-access
    visual-studio-code
    vlc
    whatsapp
)

brew cask install "${apps[@]}"
