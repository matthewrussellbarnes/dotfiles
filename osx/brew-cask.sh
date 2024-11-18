#!/usr/bin/env bash

apps=(
    1password
    anaconda
    anki
    discord
    google-chrome
    karabiner-elements
    microsoft-teams
    slack
    spotify
    slack
    private-internet-access
    visual-studio-code
    vlc
    whatsapp
)

brew cask install "${apps[@]}"
