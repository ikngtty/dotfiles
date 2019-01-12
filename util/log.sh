#!/bin/sh
set -Ceu -o pipefail

# Get util directory's absolute path.
# NOTE: Should do before changing the working directory because
# `$0` returns a relative path.
cd "$(dirname "$0")"  # Directory includes this script.
cd ../                # Project directory.
cd util
util=$(pwd)

# Alias for util.
echo_with_color() {
  "$util/echo_with_color.sh" "$@"
}
err_msg() {
  "$util/err_msg.sh" "$@"
}
status_code() {
  "$util/status_code.sh" "$@"
}

# Check arguments.
if [ $# -eq 0 ]; then
  err_msg 'An argument is required to specify file name.'
  exit "$(status_code invalid_argument)"
fi
file_name=$1
shift   # "$@" is messages.

echo_with_color magenta "[$file_name log] " "$@"
