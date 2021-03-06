#!/bin/sh
set -Ceu
if set -o | grep pipefail >/dev/null 2>&1; then
  set -o pipefail
fi

# Get util directory's absolute path.
# NOTE: Should do before changing the working directory because
# `$0` returns a relative path.
cd "$(dirname "$0")"  # Directory includes this script.
cd ../                # Project directory.
cd util
util=$(pwd)

# Alias for util.
print_with_color() {
  "$util/print_with_color.sh" "$@"
}

print_with_color "$@"
echo
