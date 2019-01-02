#!/bin/sh
#####
# This script is supposed to be read by other scripts only
# (using a 'source' or '.' command).
# Hence its file name starts with '__' (it is my rule).
# The shabang above is a mere comment to silence a linter.
#####
set -eu -o pipefail

#####
# Arguments
# $1: The absolute path of the project directory.
#####
# Check arguments.
test -d "$1"
echo "$1" | grep -q "^\/"   # Check whether it is an absolute path.

# Define paths.
dir_config=$1/config
dir_origin=$dir_config/original_files
dir_origin_home=$dir_origin/home
dir_deploy_home=$HOME
# dir_deploy_home=$1/_used_by_deploy_test   # For debug.
# mkdir -p "$dir_deploy_home"               # For debug.
dir_dummy=$1/dummy
file_shells=/etc/shells
# file_shells=$dir_dummy/shells   # For debug.
dir_init=$1/init
dir_init_mac=$dir_init/macOS

sh_check_deploy_status=$dir_config/check_deploy_status.sh
sh_deploy=$dir_config/deploy.sh

lib_plist_buddy="/usr/libexec/PlistBuddy"

# Status code
code_conflict=10
code_ambiguous_search=20
code_not_installed=30
code_not_opened_yet=40
code_different_shell=50
code_unexpected=66

# Login shell
login_shell=fish

# Deploy statuses
deploy_status_conflict=$(printf "\e[31mCONFLICT\e[m")
deploy_status_undeployed=$(printf "\e[32mUNDEPLOYED\e[m")
deploy_status_deployed=$(printf "\e[33mDEPLOYED\e[m")

# Utilities
print_with_color() {
  color=$1
  shift
  # "$@" is messages.

  case "$color" in
    red)
      color_code='\e[31m'
      ;;
    green)
      color_code='\e[32m'
      ;;
    yellow)
      color_code='\e[33m'
      ;;
    blue)
      color_code='\e[34m'
      ;;
    purple)
      color_code='\e[35m'
      ;;
    magenta)
      color_code='\e[36m'
      ;;
    white)
      color_code='\e[37m'
      ;;
    *)
      err_msg "What is $1?"
      exit $code_unexpected
  esac
  printf "$color_code"
  for msg in "$@"; do
    printf "$(echo "$msg" | sed \
      -e 's/<b>/\\e\[1m/g'\
      -e 's/<\/b>/\\e[m\'"$color_code"'/g')"
  done
  printf '\e[m'
}

echo_with_color() {
  color=$1
  shift
  print_with_color "$color" "$@"
  echo    # For a breakline.
}

log() {
  file_name=$1
  shift
  echo_with_color magenta "[$file_name log] " "$@"
}

err_msg() {
  echo_with_color red "$@"
}

success_msg() {
  echo_with_color green "$@"
}

exit_for_not_installed() {
  require_app=$1
  err_msg "Cannot run! Please install <b>$require_app</b>!"
  exit $code_not_installed
}

exit_for_not_opened_yet() {
  require_app=$1
  err_msg "Cannot run! Please open <b>$require_app</b> once!"
  exit $code_not_opened_yet
}

exit_for_diffrent_login_shell() {
  err_msg "Cannot run! Please change the login shell to <b>$login_shell</b>!"
  exit $code_different_shell
}
