#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Messages.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add "/Applications/Mail.app"
dockutil --no-restart --add "~/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Spotify.app"
dockutil --no-restart --add "/Applications/System Preferences.app"

killall Dock
