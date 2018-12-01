#!/usr/bin/env bash
set -eu -o pipefail

# WARNING: Need to reboot to reflect changes.

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.screencapture disable-shadow -bool true
# defaults write com.apple.screencapture location ~/Pictures
