#!/usr/bin/env bash
set -eu -o pipefail

# Get project directory's absolute path.
# NOTE: Should do before changing the working directory because
# `$0` returns a relative path.
my_file_name="$(basename "$0")"
cd "$(dirname "$0")"
# dir_here=$(pwd)
cd ../../
dir_project=$(pwd)

# Read the common part.
cd "$dir_project"
. ./__common.sh "$dir_project"

here_log() {
  log "$my_file_name" "$1"
}

here_log "Change preferences of Desktop, Finder, ScreenCapture, etc."
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

here_log "Change directory's visibility."
chflags nohidden ~/Library
sudo chflags nohidden /Volumes

printf "\e[32m"
printf "Yeah! $my_file_name complete! Please reboot to reflect settings."
printf "\e[m\n"
