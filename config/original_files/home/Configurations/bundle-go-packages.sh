#!/bin/sh
set -Ceu -o pipefail

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
get_with_info github.com/alecthomas/gometalinter
get_with_info github.com/derekparker/delve/cmd/dlv
get_with_info github.com/fatih/gomodifytags
get_with_info github.com/golang/lint/golint
get_with_info github.com/mdempsky/gocode
get_with_info github.com/ramya-rao-a/go-outline
get_with_info github.com/rogpeppe/godef
get_with_info github.com/sqs/goreturns
get_with_info github.com/tpng/gopkgs
get_with_info github.com/zmb3/goaddimport
get_with_info github.com/zmb3/gogetdoc
get_with_info golang.org/x/tools/cmd/goimports
get_with_info golang.org/x/tools/cmd/gorename
get_with_info golang.org/x/tools/cmd/guru
get_with_info golang.org/x/tools/cmd/stringer

## May need.
get_with_info bitbucket.org/liamstask/goose/cmd/goose

printf "\e[32m"     # Green
printf "Done!"
printf "\e[m\n"     # Reset
