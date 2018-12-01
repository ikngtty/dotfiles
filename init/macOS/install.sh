#!/usr/bin/env bash
set -eu -o pipefail

# Get project directory's absolute path.
# NOTE: Should do before changing the working directory because
# `$0` returns a relative path.
cd "$(dirname "$0")"
# dir_here=$(pwd)
cd ../../
dir_project=$(pwd)

# Read the common part.
cd "$dir_project"
. ./__common.sh "$dir_project"

# Install `Homebrew`.
if ! brew -v > /dev/null 2>&1; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Deploy `Brewfile`.
cd "$dir_project"
./config/deploy.sh "Brewfile"

# Install packages with Homebrew.
cd "$dir_deploy_home/Configurations/Homebrew-Bundle"
echo "[INFO] Running \`brew upgrade --cleanup\`"
brew upgrade --cleanup
echo "[INFO] Running \`brew bundle check\`"
brew bundle check
echo "[INFO] Running \`brew bundle\`"
brew bundle
