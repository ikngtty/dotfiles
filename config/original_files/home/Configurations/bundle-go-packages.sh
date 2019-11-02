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
  module_mode=$1
  package_url=$2
  package_name=$(basename "$package_url")
  printf "\e[36m"         # Magenta
  printf "Get $package_name..."
  printf "\e[m\n"         # Reset
  GO111MODULE="$module_mode" go get -u "$package_url"
}

# Install.
## For Atom's go-plus package.
get_with_info on github.com/fatih/gomodifytags
get_with_info on github.com/mdempsky/gocode
get_with_info on github.com/ramya-rao-a/go-outline
get_with_info on github.com/tpng/gopkgs
get_with_info on github.com/zmb3/goaddimport
get_with_info on github.com/zmb3/gogetdoc
get_with_info on golang.org/x/tools/cmd/gorename
get_with_info on golang.org/x/tools/cmd/guru
### Formatters. (Choose one.)
get_with_info on golang.org/x/tools/cmd/goimports
get_with_info on github.com/sqs/goreturns
### Linters. (Choose one.)
get_with_info off github.com/alecthomas/gometalinter # on -> mysterious error
get_with_info on github.com/golangci/golangci-lint/cmd/golangci-lint
get_with_info on github.com/mgechev/revive
## Navigators. (Choose one.)
get_with_info on github.com/rogpeppe/godef

## For Atom's go-debug package.
get_with_info off github.com/derekparker/delve/cmd/dlv # on -> mysterious error

## Gore (REPL).
get_with_info on github.com/motemen/gore/cmd/gore
### Additional features.
# get_with_info github.com/mdempsky/gocode
get_with_info on github.com/k0kubun/pp
get_with_info on golang.org/x/tools/cmd/godoc

## Others.
get_with_info on bitbucket.org/liamstask/goose/cmd/goose
get_with_info on github.com/BurntSushi/toml/cmd/tomlv
get_with_info on golang.org/x/tools/cmd/stringer

printf "\e[32m"     # Green
printf "Done!"
printf "\e[m\n"     # Reset
