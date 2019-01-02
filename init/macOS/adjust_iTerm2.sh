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

file_plist="$HOME/Library/Preferences/com.googlecode.iterm2.plist"

# Check requirements.
here_log "Check requirements."
[ -e "/Applications/iTerm.app" ] || exit_for_not_installed iTerm2
[ -e "$file_plist" ] || exit_for_not_opened_yet iTerm2
fc-list | grep -F "Inconsolata-dz for Powerline" >/dev/null 2>&1\
  || exit_for_not_installed "Inconsolata-dz for Powerline"
## To install shell integration for the expected login shell.
[ "$SHELL" == "$(which $login_shell)" ] || exit_for_diffrent_login_shell

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

# Enable shell integration.
# HACK: Prevent from unnecessary running.
here_log "Enable shell integration for the login shell."
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
# TODO: For other shells. cf. <https://www.iterm2.com/documentation-shell-integration.html>

success_msg "Yeah! $my_file_name complete!"
