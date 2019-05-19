#!/bin/sh
set -Ceu
if set -o | grep pipefail >/dev/null 2>&1; then
  set -o pipefail
else
  printf "$(echo '<red>WARNING: Cannot use pipefail option.</red>' |
    sed -e 's/<red>/\\e\[31m/g' -e 's/<\/red>/\\e\[m/g')\r\n"
fi

# Check Requirements.
if ! which stack >/dev/null 2>&1; then
  printf "\e[31m"                   # Red
  printf "Cannot run! Please install "
  printf "\e[1mstack\e[m"           # Bold and reset
  printf "\e[31m"                   # Red again
  printf "!"
  printf "\e[m\n"                   # Reset
  exit 10
fi

# Do not upgrade because if stack's interfaces are changed, bugs may be occur
# in following steps.
# # Upgrade stack.
# printf "\e[32m"                 # Green
# printf "[bundle log] Upgrade stack."
# printf "\e[m\n"                 # Reset
# stack upgrade

# Update the package index.
printf "\e[32m"                 # Green
printf "[bundle log] Update the package index."
printf "\e[m\n"                 # Reset
stack update

# Install packages.
stack_install() {
  pkg="$1"
  shift
  options="$*"
  printf "\e[32m"                 # Green
  printf "[bundle log] Start install "
  printf "\e[1m$pkg\e[m\e[36m"    # Bold and reset
  printf "."
  printf "\e[m\n"                 # Reset
  stack install "$pkg" $options
}
stack_install hlint
stack_install stylish-haskell

# TODO: Introduce haskell-ide-engine after bugs about memory consumption for mac
# is solved.

printf "\e[32m"     # Green
printf "Done!"
printf "\e[m\n"     # Reset
