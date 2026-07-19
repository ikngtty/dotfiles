#!/bin/sh
set -Ceu
if set -o | grep pipefail >/dev/null 2>&1; then
  set -o pipefail
else
  >&2 printf "$(echo '<red>WARNING: Cannot use pipefail option.</red>' |
    sed -e 's/<red>/\\e\[31m/g' -e 's/<\/red>/\\e\[m/g'
    )"
  >&2 printf "\r\n"
fi

# Check Requirements.
if ! which sbcl >/dev/null 2>&1; then
  >&2 printf "\e[31m"                   # Red
  >&2 printf "Cannot run! Please install "
  >&2 printf "\e[1msbcl\e[m"            # Bold and reset
  >&2 printf "\e[31m"                   # Red again
  >&2 printf "!"
  >&2 printf "\e[m\n"                   # Reset
  exit 10
fi

# Install Quicklisp.
if [ -f "$HOME/quicklisp/setup.lisp" ]; then
  printf "\e[36m"                   # Magenta
  printf "[bundle log] Quicklisp is already installed."
  printf "\e[m\n"                   # Reset
else
  printf "\e[32m"                   # Green
  printf "[bundle log] Installing Quicklisp."
  printf "\e[m\n"                   # Reset
  quicklisp_installer_path=$(mktemp -t quicklisp.XXXXXX)
  curl -fsSL -o "$quicklisp_installer_path" https://beta.quicklisp.org/quicklisp.lisp
  sbcl --noinform --non-interactive \
    --load "$quicklisp_installer_path" \
    --eval '(quicklisp-quickstart:install)'
  rm -f "$quicklisp_installer_path"
fi

# Install libraries.
ql_quickload() {
  lib="$1"
  printf "\e[32m"                   # Green
  printf "[bundle log] Start install "
  printf "\e[1m$lib\e[m\e[36m"      # Bold and reset
  printf "."
  printf "\e[m\n"                   # Reset
  sbcl --noinform --non-interactive \
    --eval "(ql:quickload \"$lib\")"
}
# For Alive (VSCode's extension).
ql_quickload bordeaux-threads
ql_quickload usocket
ql_quickload cl-json
ql_quickload flexi-streams

printf "\e[32m"     # Green
printf "Done!"
printf "\e[m\n"     # Reset
