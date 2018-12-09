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

file_plist="$HOME/Library/Preferences/com.googlecode.iterm2.plist"

# Check requirements.
here_log "Check requirements."
[ -e "/Applications/iTerm.app" ] || exit_for_not_installed iTerm2
[ -e "$file_plist" ] || exit_for_not_opened_yet iTerm2
fc-list | grep -F "Inconsolata-dz for Powerline" >/dev/null 2>&1\
  || exit_for_not_installed "Inconsolata-dz for Powerline"

# Change preferences.
here_log "Change preferences."
change_pref() {
  key=$1
  type=$2
  value=$3
  "$lib_plist_buddy" -c "delete '$key'" "$file_plist" 2>/dev/null && true
  "$lib_plist_buddy" -c "add '$key' '$type' '$value'" "$file_plist"
}
change_pref AllowClipboardAccess bool true
change_pref 'New Bookmarks:0:Close Sessions On End' bool false
change_pref 'New Bookmarks:0:Normal Font' string 'InconsolataForPowerline-dz 18'
change_pref 'New Bookmarks:0:Prompt Before Closing 2' integer 2
change_pref OnlyWhenMoreTabs bool false
change_pref PromptOnQuit bool false

# TODO: Install Japaneseque colorscheme.
# TODO: Choose colorscheme.

printf "\e[32m"
printf "Yeah! $my_file_name complete!"
printf "\e[m\n"
