#!/usr/bin/env bash
set -eu -o pipefail

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
project_const() {
  "$util/project_const.sh" "$@"
}
project_path() {
  "$util/project_path.sh" "$@"
}
status_code() {
  "$util/status_code.sh" "$@"
}
success_msg() {
  "$util/success_msg.sh" "$@"
}

# Import paths.
file_shells="$(project_path file shells)"
sh_dotfiles="$(project_path sh dotfiles)"
# Import consts.
login_shell="$(project_const login_shell)"
deploy_status_conflict="$(project_const deploy_status_conflict)"

here_log() {
  log "$my_file_name" "$1"
}

# Check requirements.
here_log "Check requirements."
exit_for_not_installed() {
  err_msg "Cannot run! Please install <b>$1</b>!"
  exit "$(statsu_code not_installed)"
}
zsh --version >/dev/null 2>&1 || exit_for_not_installed zsh
fish --version >/dev/null 2>&1 || exit_for_not_installed fish

# Add installed shells' path to /etc/shells
add_shells() {
  shell_name=$1
  shell_path="$(which $shell_name)"
  if ! grep -q "$shell_path" "$file_shells"; then
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
  status_line=$($sh_dotfiles check -b -q "$pattern")
  if [ "$(echo "$status_line" | wc -l)" -gt 1 ]; then
    err_msg "Oh no! I don't know which is the right <b>$pattern</b> file?"\
      " Please fix the ambiguous search in me!"
    exit "$(status_code ambiguous_search)"
  fi

  if echo "$status_line" | grep -qF "$deploy_status_conflict"; then
    err_msg "Oh my God! Cannot deploy the <b>$pattern</b> file"\
      " because it conflicts. Please resolve it!"
    exit "$(status_code conflict)"
  fi
  $sh_dotfiles deploy -q "$pattern"
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
