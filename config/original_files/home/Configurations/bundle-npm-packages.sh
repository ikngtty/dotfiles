#!/bin/sh
set -eu -o pipefail

# Check Requirements.
if ! which npm >/dev/null 2>&1; then
  printf "\e[31m"                   # Red
  printf "Cannot run! Please install "
  printf "\e[1mnpm\e[m"             # Bold and reset
  printf "\e[31m"                   # Red again
  printf "!"
  printf "\e[m\n"                   # Reset
  exit 10
fi

# Update installed packages.
npm update -g
# TODO: Are outdated packages cleaned up? Check through `npm outdated -g`.

# Install.
npm i -g elm-format
npm i -g yarn

printf "\e[32m"     # Green
printf "Done!"
printf "\e[m\n"     # Reset
