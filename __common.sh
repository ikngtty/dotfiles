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
dir_init=$1/init
dir_init_mac=$dir_init/macOS

sh_check_deploy_status=$dir_config/check_deploy_status.sh
sh_deploy=$dir_config/deploy.sh
sh_init_mac_after_install=$dir_init_mac/after_install.sh
sh_init_mac_change_defaults=$dir_init_mac/change_defaults.sh
sh_init_mac_install=$dir_init_mac/install.sh

# Provide utility functions.
# -> Nothing now.
