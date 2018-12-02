#!/usr/bin/env bash
set -eu -o pipefail

# WARNING: Need to reboot to reflect changes.

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder WarnOnEmptyTrash -bool false
defaults write com.apple.screencapture disable-shadow -bool true
# defaults write com.apple.screencapture location ~/Pictures
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

chflags nohidden ~/Library
sudo chflags nohidden /Volumes
