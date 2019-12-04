#!/bin/sh

MINOR_VERSION="$(sw_vers -productVersion | sed -E 's/([0-9]*)\.([0-9]*)\.([0-9]*)/\2/')"
if [ "$MINOR_VERSION" -gt "14" ]; then
    # From 10.15, macOS moved system apps (Mail, etc) to /System/Applications
    SYSTEM_APPLICATIONS_PATH="/System/Applications"
else
    SYSTEM_APPLICATIONS_PATH="/Applications"
fi

dockutil --no-restart --remove all
dockutil --no-restart --add "$SYSTEM_APPLICATIONS_PATH/Messages.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add "$SYSTEM_APPLICATIONS_PATH/Mail.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Quiver.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/WhatsApp.app"
dockutil --no-restart --add "$SYSTEM_APPLICATIONS_PATH/System Preferences.app"

killall Dock
