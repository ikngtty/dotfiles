#!/bin/sh
set -eu -o pipefail

# Get absolute paths.
# NOTE: Should do before changing the working directory because
# `$0` returns a relative path.
cd "$(dirname "$0")"
util=$(pwd)
cd ../
project_dir_path=$(pwd)

usage() {
  cat <<EOS
Usage: project_path.sh <kind> <name>

Show paths for this project.

args:
  kind    Path's kind. One of these:
          dir     The path of a related directory.
          file    The path of a related file.
          sh      The path of my shell script.
          lib     The path of someone's library.

  name    Name to specify a path.

EOS
}

# Alias for util.
err_msg() {
  "$util/err_msg.sh" "$@"
}

# Check arguments.
if [ $# -ne 2 ]; then
  err_msg "The number of arguments is $#, but it should be 2."
  echo
  usage
  exit 1
fi
kind="$1"
name="$2"

case "$kind" in
  dir)
    case "$name" in
      origin_home)
        echo "$project_dir_path/config/original_files/home"
        ;;
      deploy_home)
        echo "$HOME"
        # mkdir -p "$project_dir_path/_used_by_deploy_test" # For debug.
        # echo "$project_dir_path/_used_by_deploy_test"     # For debug.
        ;;
      *)
        err_msg "Directory \"$name\" does not exist."
        exit 1
        ;;
    esac
    ;;
  file)
    case "$name" in
      shells)
        echo '/etc/shells'
        # echo "$project_dir_path/dummy/shells"   # For debug.
        ;;
      *)
        err_msg "File \"$name\" does not exist."
        exit 1
        ;;
    esac
    ;;
  sh)
    case "$name" in
      dotfiles)
        echo "$project_dir_path/config/dotfiles.sh"
        ;;
      *)
        err_msg "Shell script \"$name\" does not exist."
        exit 1
        ;;
    esac
    ;;
  lib)
    case "$name" in
      plist_buddy)
        echo '/usr/libexec/PlistBuddy'
        ;;
      *)
        err_msg "Library \"$name\" does not exist."
        exit 1
        ;;
    esac
    ;;
  *)
    err_msg "Kind \"$kind\" does not exist."
    echo
    usage
    exit 1
    ;;
esac
