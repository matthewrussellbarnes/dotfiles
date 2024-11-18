#!/usr/bin/env bash

apps=(
   1password
   anaconda
   anki
   brave-browser
   discord
   karabiner-elements
   microsoft-excel
   microsoft-powerpoint
   microsoft-teams
   microsoft-word
   slack
   spotify
   private-internet-access
   visual-studio-code
   vlc
   whatsapp
   zotero
)

# Install packages, attempt upgrade if already installed
for app in "${apps[@]}"; do
   brew install --cask $app || brew upgrade --cask $app
done