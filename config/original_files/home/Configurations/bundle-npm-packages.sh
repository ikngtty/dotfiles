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
npm i -g elm-live
npm i -g spaceship-prompt
npm i -g standard
npm i -g yarn
## For <https://www.npmjs.com/package/eslint-config-prettier-standard>.
npm i -g eslint
npm i -g eslint-config-prettier
npm i -g eslint-config-prettier-standard
npm i -g eslint-config-standard
npm i -g eslint-plugin-import
npm i -g eslint-plugin-node
npm i -g eslint-plugin-prettier
npm i -g eslint-plugin-promise
npm i -g eslint-plugin-standard
npm i -g prettier

printf "\e[32m"     # Green
printf "Done!"
printf "\e[m\n"     # Reset
