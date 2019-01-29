#!/usr/bin/env bash
set -Ceu -o pipefail

# Get util directory's absolute path.
# NOTE: Should do before changing the working directory because
# `$0` returns a relative path.
my_file_name="$(basename "$0")"
cd "$(dirname "$0")"  # Directory includes this script.
cd ../../             # Project directory.
cd util
util=$(pwd)

# Alias for util.
log() {
  "$util/log.sh" "$@"
}
project_path() {
  "$util/project_path.sh" "$@"
}
success_msg() {
  "$util/success_msg.sh" "$@"
}

# Import paths.
dir_deploy_home="$(project_path dir deploy_home)"
sh_dotfiles="$(project_path sh dotfiles)"

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
$sh_dotfiles deploy -q "Brewfile"

# Install packages with Homebrew.
cd "$dir_deploy_home/Configurations/Homebrew-Bundle"
here_log "Run \`brew cleanup\`."
brew cleanup
here_log "Run \`brew upgrade\`."
brew upgrade
here_log "Run \`brew cleanup\`."
brew cleanup
here_log "Run \`brew bundle check\`."
# brew bundle check
# TODO: Research the `brew bundle check` feature.
here_log "Run \`brew bundle\`."
brew bundle
here_log "Run \`brew cleanup\`."
brew cleanup

success_msg "Yeah! $my_file_name complete!"
