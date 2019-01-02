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
# shellcheck source=../../__common.sh
. ./__common.sh "$dir_project"

here_log() {
  log "$my_file_name" "$1"
}

# Change preferences.
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
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Remove directories' localization file.
rm_if_exist() {
  file_path=$1
  if [ -e "$file_path" ]; then
    here_log "Remove $file_path"
    rm "$file_path"
  fi
}
rm_if_exist ~/Applications/.localized
rm_if_exist ~/Desktop/.localized
rm_if_exist ~/Documents/.localized
rm_if_exist ~/Downloads/.localized
rm_if_exist ~/Library/.localized
rm_if_exist ~/Movies/.localized
rm_if_exist ~/Music/.localized
rm_if_exist ~/Pictures/.localized
rm_if_exist ~/Public/.localized
rm_if_exist /Applications/.localized
# TODO: Why cannot they be removed?
# rm_if_exist /Library/.localized
# rm_if_exist /System/.localized
# rm_if_exist /Users/.localized
# TODO: Find more.

# NOTE: Copied them from somewhere, but they may be unnecessary.
# here_log "Change directory's visibility."
# chflags nohidden ~/Library
# sudo chflags nohidden /Volumes

success_msg "Yeah! $my_file_name complete! Please reboot to reflect settings."
