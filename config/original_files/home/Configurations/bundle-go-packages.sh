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
  mode=$1
  package_url=$2
  printf "\e[36m"         # Magenta
  printf "Get $package_url ..."
  printf "\e[m\n"         # Reset
  case "$mode" in
    module )
      GO111MODULE=on go get -u "$package_url"
      ;;
    gopath )
      (
        export GOBIN="$GOPATH/bin"
        export GOPATH="$GOPATH/gopath-get"
        GO111MODULE=off go get -u "$package_url"
      )
      ;;
    * )
      printf "\e[31m"   # Red
      printf "Mode \"$mode\" is unexpected. Please fix the script!"
      printf "\e[m\n"   # Reset
      exit 20
  esac
}

# Install.
## For Atom's go-plus package.
# get_with_info module github.com/fatih/gomodifytags      # Duplicate
# get_with_info module github.com/mdempsky/gocode         # Duplicate
# get_with_info module github.com/ramya-rao-a/go-outline  # Duplicate
# get_with_info module github.com/tpng/gopkgs # NOTE: old version
# get_with_info module github.com/zmb3/goaddimport
# get_with_info module github.com/zmb3/gogetdoc           # Duplicate
# get_with_info module golang.org/x/tools/cmd/gorename    # Duplicate
# get_with_info module golang.org/x/tools/cmd/guru        # Duplicate
### Formatters. (Choose one.)
# get_with_info module golang.org/x/tools/cmd/goimports   # Duplicate
# get_with_info module github.com/sqs/goreturns           # Duplicate
### Linters. (Choose one.)
# get_with_info module github.com/golangci/golangci-lint/cmd/golangci-lint # Duplicate
# get_with_info module github.com/mgechev/revive          # Duplicate
## Navigators. (Choose one.)
# get_with_info module github.com/rogpeppe/godef          # Duplicate

## For Atom's go-debug package.
# get_with_info module github.com/go-delve/delve/cmd/dlv  # Duplicate

## For VSCode's Go package.
## NOTE: If they are not installed, VSCode automatically guides us to install them.
get_with_info module github.com/mdempsky/gocode
get_with_info module github.com/uudashr/gopkgs/v2/cmd/gopkgs
get_with_info module github.com/ramya-rao-a/go-outline
get_with_info module golang.org/x/tools/cmd/gorename
get_with_info module github.com/fatih/gomodifytags
# get_with_info module github.com/go-delve/delve/cmd/dlv # TODO: mysterious error
# get_with_info module github.com/stamblerre/gocode # TODO: name as "gocode-gomod"
get_with_info module github.com/rogpeppe/godef
### Docs. (Choose one.)
get_with_info module golang.org/x/tools/cmd/godoc
get_with_info module github.com/zmb3/gogetdoc
get_with_info module golang.org/x/tools/cmd/guru
### Formatters. (Choose one.)
get_with_info module golang.org/x/tools/cmd/goimports
get_with_info module github.com/sqs/goreturns
get_with_info module winterdrache.de/goformat/goformat
### Linters.  (Choose one.)
get_with_info module golang.org/x/lint/golint
get_with_info module github.com/golangci/golangci-lint/cmd/golangci-lint
get_with_info module github.com/mgechev/revive
get_with_info module honnef.co/go/tools/... # NOTE: use "staticcheck"

## Gore (REPL).
get_with_info module github.com/motemen/gore/cmd/gore
### Additional features.
# get_with_info github.com/mdempsky/gocode                # Duplicate
get_with_info module github.com/k0kubun/pp
# get_with_info module golang.org/x/tools/cmd/godoc       # Duplicate

## Others.
get_with_info module bitbucket.org/liamstask/goose/cmd/goose
get_with_info module github.com/BurntSushi/toml/cmd/tomlv
get_with_info module golang.org/x/tools/cmd/stringer

printf "\e[32m"     # Green
printf "Done!"
printf "\e[m\n"     # Reset
