#!/usr/bin/env bash
set -eu -o pipefail

# Get util directory's absolute path.
# NOTE: Should do before changing the working directory because
# `$0` returns a relative path.
my_file_name="$(basename "$0")"
cd "$(dirname "$0")"  # Directory includes this script.
cd ../../             # Project directory.
cd util
util=$(pwd)

# Alias for util.
err_msg() {
  "$util/err_msg.sh" "$@"
}
log() {
  "$util/log.sh" "$@"
}
project_const() {
  "$util/project_const.sh" "$@"
}
project_path() {
  "$util/project_path.sh" "$@"
}
status_code() {
  "$util/status_code.sh" "$@"
}
success_msg() {
  "$util/success_msg.sh" "$@"
}

# Import paths.
lib_plist_buddy="$(project_path lib plist_buddy)"
# Import consts.
login_shell="$(project_const login_shell)"

here_log() {
  log "$my_file_name" "$1"
}

file_plist="$HOME/Library/Preferences/com.googlecode.iterm2.plist"

# Check requirements.
here_log "Check requirements."
exit_for_not_installed() {
  err_msg "Cannot run! Please install <b>$1</b>!"
  exit "$(statsu_code not_installed)"
}
exit_for_not_opened_yet() {
  err_msg "Cannot run! Please open <b>$1</b> once!"
  exit "$(statsu_code not_opened_yet)"
}
exit_for_different_login_shell() {
  err_msg "Cannot run! Please change the login shell to <b>$login_shell</b>!"
  exit "$(statsu_code different_shell)"
}
[ -e "/Applications/iTerm.app" ] || exit_for_not_installed iTerm2
[ -e "$file_plist" ] || exit_for_not_opened_yet iTerm2
fc-list | grep -qF "Inconsolata-dz for Powerline"\
  || exit_for_not_installed "Inconsolata-dz for Powerline"
## To install shell integration for the expected login shell.
[ "$SHELL" == "$(which $login_shell)" ] || exit_for_different_login_shell

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
