#!/bin/sh
set -eu -o pipefail

# Get project directory's absolute path.
# NOTE: Should do before changing the working directory because
# `$0` returns a relative path.
cd "$(dirname "$0")"
# dir_here=$(pwd)
dir_project=$(pwd)

# Read the common part.
cd "$dir_project"
. ./__common.sh "$dir_project"

sh_scripts | while read sh_script; do
  [ "$sh_script" = "$sh_make_scripts_executable" ] && continue
  chmod +x "$sh_script"
done
