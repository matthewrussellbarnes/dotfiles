#!/usr/bin/env bash

# Request administrator privileges upfront
sudo -v

# Keep sudo privileges active until script finishes
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# System Configuration                                                         #
###############################################################################

# Set computer name
sudo scutil --set ComputerName "freisolninby"
sudo scutil --set HostName "freisolninby"
sudo scutil --set LocalHostName "freisolninby"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "freisolninby"

# Power Management
# Set standby delay to 24 hours (default is 1 hour)
# sudo pmset -a standbydelay 86400

# System Audio
# Disable startup sound
# sudo nvram StartupMute=%01
# Disable audio feedback when volume is changed
# defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool false

# Software Updates
# Check for updates daily instead of weekly
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# Enable automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
# Enable automatic download of updates
defaults write com.apple.SoftwareUpdate AutomaticDownload -bool true

###############################################################################
# User Interface                                                              #
###############################################################################

# Menu Bar
# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -bool true
# Customize menu bar items
# defaults write com.apple.controlcenter "NSStatusItem Visible Battery" -bool true
# defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true
# defaults write com.apple.controlcenter "NSStatusItem Visible WiFi" -bool true

# Window Management
# Disable window opening/closing animations
# defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
# Accelerate window resize speed
# defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Save/Print Dialogs
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Application Management
# Auto-quit printer app when jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
# Disable "Are you sure you want to open this application?" dialog
# defaults write com.apple.LaunchServices LSQuarantine -bool false
# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

###############################################################################
# Input Devices                                                               #
###############################################################################

# Trackpad
# Enable tap to click
# defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# Enable three-finger swipe between pages
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 1

# Keyboard
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Set fast key repeat rate
# defaults write NSGlobalDomain KeyRepeat -int 2
# defaults write NSGlobalDomain InitialKeyRepeat -int 15
# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Disable smart quotes and dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Bluetooth
# Increase sound quality for Bluetooth headphones
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

###############################################################################
# Screen                                                                      #
###############################################################################

# Screenshots
# Set screenshot location
mkdir -p "${HOME}/Desktop/screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Desktop/screenshots"
# Set screenshot format (options: png, jpg, pdf, tiff)
defaults write com.apple.screencapture type -string "png"
# Disable screenshot thumbnail
# defaults write com.apple.screencapture show-thumbnail -bool false
# Disable shadow in screenshots
# defaults write com.apple.screencapture disable-shadow -bool true

# Display
# Enable subpixel font rendering on non-Apple displays
defaults write NSGlobalDomain AppleFontSmoothing -int 2
# Enable HiDPI display modes
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

# Behavior
# Allow quitting Finder
defaults write com.apple.finder QuitMenuItem -bool true
# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Enable text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Search
# Search current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# File Management
# Disable .DS_Store file creation on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# Disable .DS_Store file creation on USB volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Enable secure empty trash
# Note: Modern SSDs handle this automatically
defaults write com.apple.finder EmptyTrashSecurely -bool true

# View Options
# Set list view as default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Show hidden files
# defaults write com.apple.finder AppleShowAllFiles -bool true

###############################################################################
# Dock                                                                        #
###############################################################################

# Appearance
# Set icon size
defaults write com.apple.dock tilesize -int 50
# Show indicator lights for open applications
defaults write com.apple.dock show-process-indicators -bool true
# Make hidden app icons translucent
defaults write com.apple.dock showhidden -bool true

# Behavior
# Enable auto-hide
defaults write com.apple.dock autohide -bool true
# Set auto-hide delay
defaults write com.apple.dock autohide-delay -float 0
# Set animation speed
defaults write com.apple.dock autohide-time-modifier -float 0.5
# Disable app launch animation
# defaults write com.apple.dock launchanim -bool false

###############################################################################
# Safari                                                                      #
###############################################################################

# Privacy & Security
# Enable Developer menu
defaults write com.apple.Safari IncludeDevelopMenu -bool true
# Enable Web Inspector
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
# Add context menu item for web inspector
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Interface
# Set homepage
defaults write com.apple.Safari HomePage -string "about:blank"
# Hide bookmarks bar
defaults write com.apple.Safari ShowFavoritesBar -bool false
# Disable thumbnail cache
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

###############################################################################
# Mail                                                                        #
###############################################################################

# Interface
# Display emails in threaded mode
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
# Disable animations
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

# Composing
# Copy email addresses without names
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
# Disable automatic spell checking
defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"

# Notifications
# Disable sounds
defaults write com.apple.mail MailSound -string ""
defaults write com.apple.mail PlayMailSounds -bool false

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# View
# Show main window on launch
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
# Show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 0
# Sort by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Dock Icon
# Show CPU usage in dock
defaults write com.apple.ActivityMonitor IconType -int 5

###############################################################################
# Mac App Store                                                               #
###############################################################################

# Development
# Enable debug menu
defaults write com.apple.appstore ShowDebugMenu -bool true
# Enable WebKit Developer Tools
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

###############################################################################
# Terminal                                                                    #
###############################################################################

# Encoding
# Use only UTF-8
defaults write com.apple.terminal StringEncodings -array 4

# Audio
# Disable audio feedback
defaults write com.apple.terminal "Bell" -bool false
defaults write com.apple.terminal "VisualBell" -bool false

###############################################################################
# Apply Changes                                                               #
###############################################################################

# Restart affected applications
for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
    "Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
    "Terminal" "iTunes" "iCal"; do
    killall "${app}" &> /dev/null
done

echo "Configuration complete. Some changes may require a logout/restart to take effect."