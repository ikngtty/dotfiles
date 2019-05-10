#!/bin/sh
set -Ceu -o pipefail

# Check Requirements.
if ! which conda >/dev/null 2>&1; then
  printf "\e[31m"                   # Red
  printf "Cannot run! Please install "
  printf "\e[1mconda\e[m"              # Bold and reset
  printf "\e[31m"                   # Red again
  printf "!"
  printf "\e[m\n"                   # Reset
  exit 10
fi

install_message() {
  package_name=$1
  printf "\e[36m"         # Magenta
  printf "Install $package_name..."
  printf "\e[m\n"         # Reset
}

install_message python-language-server
conda install -c=conda-forge python-language-server

printf "\e[32m"     # Green
printf "Done!"
printf "\e[m\n"     # Reset
