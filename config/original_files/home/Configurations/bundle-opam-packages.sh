#!/bin/sh
set -eu -o pipefail

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
