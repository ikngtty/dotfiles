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
err_msg() {
  "$util/err_msg.sh" "$@"
}
status_code() {
  "$util/status_code.sh" "$@"
}

# Check arguments.
if [ $# -eq 0 ]; then
  err_msg 'An argument is required to specify a color.'
  exit "$(status_code invalid_argument)"
fi
color=$1
case "$color" in
  red)
    color_code='\e[31m'
    ;;
  green)
    color_code='\e[32m'
    ;;
  yellow)
    color_code='\e[33m'
    ;;
  blue)
    color_code='\e[34m'
    ;;
  purple)
    color_code='\e[35m'
    ;;
  magenta)
    color_code='\e[36m'
    ;;
  white)
    color_code='\e[37m'
    ;;
  *)
    err_msg "Color \"$color\" does not exist."
    exit "$(status_code invalid_argument)"
esac
shift     # "$@" is messages.

printf "$color_code"
for msg in "$@"; do
  printf "$(echo "$msg" | sed \
    -e 's/<b>/\\e\[1m/g'\
    -e 's/<\/b>/\\e[m\'"$color_code"'/g')"
done
printf '\e[m'
