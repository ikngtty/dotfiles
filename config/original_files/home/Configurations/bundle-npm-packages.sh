#!/bin/sh
set -Ceu
if set -o | grep pipefail >/dev/null 2>&1; then
  set -o pipefail
else
  printf "$(echo '<red>WARNING: Cannot use pipefail option.</red>' |
    sed -e 's/<red>/\\e\[31m/g' -e 's/<\/red>/\\e\[m/g'
    )"
  printf "\r\n"
fi

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

# Update npm.
printf "\e[32m"                 # Green
printf "[bundle log] Updating npm."
printf "\e[m\n"                 # Reset
npm update -g npm

# Update installed packages.
printf "\e[32m"                 # Green
printf "[bundle log] Updating installed packages."
printf "\e[m\n"                 # Reset
npm update -g
# TODO: Are outdated packages cleaned up? Check through `npm outdated -g`.

# Install packages.
# TODO: Use yarn.
npm_i() {
  pkg="$1"
  # NOTE: To check whether the package is installed or not, `npm ls -g "$pkg"`
  # has trouble because it raises an error when the package is installed but
  # contains an "UNMET PEER DEPENDENCY" error.
  if npm explore -g "$pkg" >/dev/null 2>&1; then
    printf "\e[36m"                 # Magenta
    printf "[bundle log] "
    printf "\e[1m$pkg\e[m\e[36m"    # Bold and reset
    printf " is already installed."
    printf "\e[m\n"                 # Reset
  else
    printf "\e[32m"                 # Green
    printf "[bundle log] Start install "
    printf "\e[1m$pkg\e[m\e[36m"    # Bold and reset
    printf "."
    printf "\e[m\n"                 # Reset
    npm i -g "$pkg"
  fi
}
npm_i @google/clasp
npm_i elm-analyse
npm_i elm-live
npm_i node-giff
npm_i rebase-editor
npm_i spaceship-prompt
npm_i standard
npm_i wtfjs
npm_i yarn
## For <https://github.com/edubkendo/atom-elm>. (But Elmjutsu says I need not to install it.)
npm_i elm-oracle
## For <https://marketplace.visualstudio.com/items?itemName=Elmtooling.elm-ls-vscode>.
npm_i elm-format
npm_i elm-test
## For <https://www.npmjs.com/package/eslint-config-prettier-standard>.
npm_i eslint
npm_i eslint-config-prettier
npm_i eslint-plugin-import
npm_i eslint-plugin-node
npm_i eslint-plugin-promise
npm_i eslint-plugin-standard
npm_i eslint-config-standard
npm_i prettier
npm_i eslint-plugin-prettier
npm_i eslint-config-prettier-standard

printf "\e[32m"     # Green
printf "Done!"
printf "\e[m\n"     # Reset
