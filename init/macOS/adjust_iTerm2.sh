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

# Check whether iTerm2 is installed.
if [ ! -e "/Applications/iTerm.app" ]; then
  printf "\e[31m"                   # Red
  printf "Oh my God! Failed to run because "
  printf "\e[1miTerm2\e[m"     # Bold
  printf "\e[31m"                   # Red
  printf " is not installed. "
  printf "Please install it!"
  printf "\e[m\n"                   # Normal text
  exit $code_not_installed
fi

# Check whether Inconsolata-dz for Powerline is installed.
if ! fc-list | grep -F "Inconsolata-dz for Powerline" >/dev/null 2>&1; then
  printf "\e[31m"                   # Red
  printf "Oh my God! Failed to run because "
  printf "\e[1mInconsolata-dz for Powerline\e[m"     # Bold
  printf "\e[31m"                   # Red
  printf " is not installed. "
  printf "Please install it!"
  printf "\e[m\n"                   # Normal text
  exit $code_not_installed
fi

# Check Wheter iTerm2 has been opened before.
file_plist="$HOME/Library/Preferences/com.googlecode.iterm2.plist"
if [ ! -e "$file_plist" ]; then
  printf "\e[31m"                   # Red
  printf "Oh my God! Failed to run because "
  printf "\e[1miTerm2\e[m"     # Bold
  printf "\e[31m"                   # Red
  printf " has not been opened yet. "
  printf "Please open it once!"
  printf "\e[m\n"                   # Normal text
  exit $code_not_opened
fi

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
