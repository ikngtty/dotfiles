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

sh_make_scripts_executable=$1/make_scripts_executable.sh
sh_check_deploy_status=$dir_config/check_deploy_status.sh
sh_deploy=$dir_config/deploy.sh
sh_init_mac_after_install=$dir_init_mac/after_install.sh
sh_init_mac_change_defaults=$dir_init_mac/change_defaults.sh
sh_init_mac_install=$dir_init_mac/install.sh
sh_scripts() {
  cat << EOF
$sh_make_scripts_executable
$sh_check_deploy_status
$sh_deploy
$sh_init_mac_after_install
$sh_init_mac_change_defaults
$sh_init_mac_install
EOF
}

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
