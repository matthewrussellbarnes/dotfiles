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
   private-internet-access
   visual-studio-code
   vlc
   whatsapp
)

# Install packages, attempt upgrade if already installed
for app in "${apps[@]}"; do
   brew install --cask $app || brew upgrade --cask $app
done