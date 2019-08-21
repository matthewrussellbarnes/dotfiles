#!/usr/bin/env bash

apps=(
    dash
    dropbox
    firefox
    flux
    google-chrome
    google-drive
    iterm2
    spotify
    sublime-text3
    vlc
    virtualbox
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package && qlmanage -r
