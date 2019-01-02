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
# shellcheck source=../../__common.sh
. ./__common.sh "$dir_project"

here_log() {
  log "$my_file_name" "$1"
}

# Check requirements.
here_log "Check requirements."
zsh --version >/dev/null 2>&1 || exit_for_not_installed zsh
fish --version >/dev/null 2>&1 || exit_for_not_installed fish

# Add installed shells' path to /etc/shells
add_shells() {
  shell_name=$1
  shell_path="$(which $shell_name)"
  if ! grep "$shell_path" "$file_shells" > /dev/null; then
    here_log "Add '$shell_name' path to '$file_shells'."
    sudo bash -c "echo '$shell_path' >> '$file_shells'"
  fi
}
add_shells zsh
add_shells fish

# Change the login shell.
if [ "$SHELL" != "$(which $login_shell)" ]; then
  here_log "Change login shell to $login_shell."
  chsh -s "$(which $login_shell)"
  echo_with_color green "Login shell has changed!"\
    " Please relogin to your terminal."
fi

# Deploy rc files.
here_log "Deploy rc files if it has not."
deploy_rc() {
  pattern=$1
  status_line=$($sh_check_deploy_status "$pattern" | tail -n +2)
  if [ "$(echo "$status_line" | wc -l)" -gt 1 ]; then
    err_msg "Oh no! I don't know which is the right <b>$pattern</b> file?"\
      " Please fix the ambiguous search in me!"
    exit $code_ambiguous_search
  fi

  if echo "$status_line" | grep -F "$deploy_status_conflict" > /dev/null ; then
    err_msg "Oh my God! Cannot deploy the <b>$pattern</b> file"\
      " because it conflicts. Please resolve it!"
    exit $code_conflict
  fi
  $sh_deploy "$pattern"
}
deploy_rc config.fish
deploy_rc fishfile
deploy_rc .zprofile
deploy_rc .zshrc

# Install Fisherman
here_log "Install Fisherman."
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# Install packages by Fisherman's fishfile.
here_log 'Run `fisher`.'
fish -c fisher

success_msg "Yeah! $my_file_name complete!"
