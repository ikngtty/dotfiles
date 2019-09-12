#!/bin/sh
set -Ceu
if set -o | grep pipefail >/dev/null 2>&1; then
  set -o pipefail
fi

# NOTE: My Mac (Mojabe) says "there is no file in the specified path"
# when the specified path is a symlink and the linked file is lost.
# But if I try to create a new file in the specified path, my Mac says
# "Error! the specified file exists!". It is undesirable.
[ -e "$1" ] || readlink "$1" >/dev/null 2>&1
