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
echo_with_color() {
  "$util/echo_with_color.sh" "$@"
}

echo_with_color green "$@"
