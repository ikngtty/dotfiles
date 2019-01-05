#!/bin/sh
set -eu -o pipefail

# Get util directory's absolute path.
# NOTE: Should do before changing the working directory because
# `$0` returns a relative path.
cd "$(dirname "$0")"  # Directory includes this script.
cd ../                # Project directory.
cd util
util=$(pwd)

# Alias for util.
err_msg() {
  "$util/err_msg.sh" "$@"
}

# Check arguments.
if [ $# -ne 1 ]; then
  err_msg "The number of arguments is $#, but it should be 1."
  exit 1
fi
const_name="$1"

case "$const_name" in
  login_shell)
    echo fish
    ;;
  deploy_status_conflict)
    printf "\e[31mCONFLICT\e[m"
    ;;
  deploy_status_undeployed)
    printf "\e[32mUNDEPLOYED\e[m"
    ;;
  deploy_status_deployed)
    printf "\e[33mDEPLOYED\e[m"
    ;;
  *)
    err_msg "Const name \"$const_name\" does not exist."
    exit 1
esac
