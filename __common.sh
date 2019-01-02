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

# Login shell
login_shell=fish

# Provide utility functions.
log() {
  file_name=$1
  msg=$2
  printf "\e[36m"
  printf "[$1 log] $2"
  printf "\e[m\n"
}

exit_for_not_installed() {
  require_app=$1
  printf "\e[31m"                   # Red
  printf "Cannot run! Please install "
  printf "\e[1m$1\e[m"              # Bold and reset
  printf "\e[31m"                   # Red again
  printf "!"
  printf "\e[m\n"                   # Reset
  exit $code_not_installed
}

exit_for_not_opened_yet() {
  require_app=$1
  printf "\e[31m"                   # Red
  printf "Cannot run! Please open "
  printf "\e[1m$1\e[m"              # Bold and reset
  printf "\e[31m"                   # Red again
  printf " once!"
  printf "\e[m\n"                   # Reset
  exit $code_not_opened_yet
}

exit_for_diffrent_login_shell() {
  printf "\e[31m"                   # Red
  printf "Cannot run! Please change the login shell to "
  printf "\e[1m$login_shell\e[m"    # Bold and reset
  printf "\e[31m"                   # Red again
  printf "!"
  printf "\e[m\n"                   # Reset
  exit $code_different_shell
}
