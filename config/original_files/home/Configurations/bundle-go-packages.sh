#!/bin/sh
set -Ceu
if set -o | grep pipefail >/dev/null 2>&1; then
  set -o pipefail
else
  printf "$(echo '<red>WARNING: Cannot use pipefail option.</red>' |
    sed -e 's/<red>/\\e\[31m/g' -e 's/<\/red>/\\e\[m/g')\r\n"
fi

# Check Requirements.
if ! which go >/dev/null 2>&1; then
  printf "\e[31m"                   # Red
  printf "Cannot run! Please install "
  printf "\e[1mGo\e[m"              # Bold and reset
  printf "\e[31m"                   # Red again
  printf "!"
  printf "\e[m\n"                   # Reset
  exit 10
fi

get_with_info() {
  package_url=$1
  package_name=$(basename "$package_url")
  printf "\e[36m"         # Magenta
  printf "Get $package_name..."
  printf "\e[m\n"         # Reset
  go get -u "$package_url"
}

# Install.
# TODO: Find a tool to manage dependency without a vendor directory.
## For Atom's go-plus package.
get_with_info github.com/fatih/gomodifytags
get_with_info github.com/mdempsky/gocode
get_with_info github.com/ramya-rao-a/go-outline
get_with_info github.com/tpng/gopkgs
get_with_info github.com/zmb3/goaddimport
get_with_info github.com/zmb3/gogetdoc
get_with_info golang.org/x/tools/cmd/gorename
get_with_info golang.org/x/tools/cmd/guru
### Formatters. (Choose one.)
get_with_info golang.org/x/tools/cmd/goimports
get_with_info github.com/sqs/goreturns
### Linters. (Choose one.)
get_with_info github.com/alecthomas/gometalinter
get_with_info github.com/golangci/golangci-lint/cmd/golangci-lint
get_with_info github.com/mgechev/revive
## Navigators. (Choose one.)
get_with_info github.com/rogpeppe/godef

## For Atom's go-debug package.
get_with_info github.com/derekparker/delve/cmd/dlv

## Gore (REPL).
get_with_info github.com/motemen/gore/cmd/gore
### Additional features.
# get_with_info github.com/mdempsky/gocode
get_with_info github.com/k0kubun/pp
get_with_info golang.org/x/tools/cmd/godoc

## Others.
get_with_info bitbucket.org/liamstask/goose/cmd/goose
get_with_info github.com/BurntSushi/toml/cmd/tomlv
get_with_info golang.org/x/tools/cmd/stringer

printf "\e[32m"     # Green
printf "Done!"
printf "\e[m\n"     # Reset
