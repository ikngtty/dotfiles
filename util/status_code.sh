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
status_code() {
  # Recursive call.
  "$util/status_code.sh" "$@"
}

# Check arguments.
if [ $# -ne 1 ]; then
  err_msg "The number of arguments is $#, but it should be 1."
  exit "$(status_code invalid_argument)"
fi
status_name="$1"

case "$status_name" in
  conflict)
    echo 10
    ;;
  ambiguous_search)
    echo 20
    ;;
  not_installed)
    echo 30
    ;;
  not_opend_yet)
    echo 40
    ;;
  different_shell)
    echo 50
    ;;
  invalid_argument)
    echo 60
    ;;
  *)
    err_msg "Status name \"$status_name\" does not exist."
    exit "$(status_code invalid_argument)"
esac
