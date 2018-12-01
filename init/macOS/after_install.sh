#!/usr/bin/env bash
set -eu -o pipefail

# Get project directory's absolute path.
# NOTE: Should do before changing the working directory because
# `$0` returns a relative path.
my_file_name="$(basename "$0")"
cd "$(dirname "$0")"
# dir_here=$(pwd)
cd ../../
dir_project=$(pwd)

# Read the common part.
cd "$dir_project"
. ./__common.sh "$dir_project"

here_log() {
  log "$my_file_name" "$1"
}

# TODO: Change the login shell to fish if not.


printf "\e[32m"
printf "Yeah! $my_file_name complete!"
printf "\e[m\n"
