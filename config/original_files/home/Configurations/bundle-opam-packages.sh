#!/bin/sh
set -Ceu
if set -o | grep pipefail >/dev/null 2>&1; then
  set -o pipefail
else
  printf "$(echo '<red>WARNING: Cannot use pipefail option.</red>' |
    sed -e 's/<red>/\\e\[31m/g' -e 's/<\/red>/\\e\[m/g')\r\n"
fi

# Check Requirements.
if ! which opam >/dev/null 2>&1; then
  printf "\e[31m"                   # Red
  printf "Cannot run! Please install "
  printf "\e[1mopam\e[m"            # Bold and reset
  printf "\e[31m"                   # Red again
  printf "!"
  printf "\e[m\n"                   # Reset
  exit 10
fi

# Update the list of avaibale packages.
opam update

# Upgrade installed packeages.
opam upgrade

# Install.
opam install ocaml

opam install merlin
opam install ocp-indent
opam install utop

# Clean up chches.
opam clean

printf "\e[32m"     # Green
printf "Done!"
printf "\e[m\n"     # Reset
