#!/usr/bin/env bash
set -eu -o pipefail

# Get project directory's absolute path.
# NOTE: Should do before changing the working directory because
# `$0` returns a relative path.
my_file_name="$(basename "$0")"
cd "$(dirname "$0")"
# dir_here=$(pwd)
cd ../../
dir_project=$(pwd)

# Read the common part.
cd "$dir_project"
. ./__common.sh "$dir_project"

here_log() {
  log "$my_file_name" "$1"
}

# Install `Homebrew`.
if ! brew -v > /dev/null 2>&1; then
  here_log "Install Homebrew."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Deploy `Brewfile`.
here_log "Deploy Brewfile if it has not."
$sh_deploy "Brewfile"

# Install packages with Homebrew.
cd "$dir_deploy_home/Configurations/Homebrew-Bundle"
here_log "Run \`brew upgrade --cleanup\`."
brew upgrade --cleanup
here_log "Run \`brew bundle check\`."
brew bundle check
here_log "Run \`brew bundle\`."
brew bundle

printf "\e[32m"
printf "Yeah! $my_file_name complete!"
printf "\e[m\n"