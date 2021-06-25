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
if ! which opam >/dev/null 2>&1; then
  >&2 printf "\e[31m"                   # Red
  >&2 printf "Cannot run! Please install "
  >&2 printf "\e[1mopam\e[m"            # Bold and reset
  >&2 printf "\e[31m"                   # Red again
  >&2 printf "!"
  >&2 printf "\e[m\n"                   # Reset
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
