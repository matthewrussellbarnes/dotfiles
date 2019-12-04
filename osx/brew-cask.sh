#!/usr/bin/env bash

apps=(
    dropbox
    firefox
    flux
    google-chrome
    iterm2
    spotify
    slack
    vlc
    virtualbox
    visual-studio-code
    whatsapp
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv webpquicklook suspicious-package && qlmanage -r
