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

# Check requirements.
here_log "Check requirements."
exit_for_no_shell() {
  st=$?
  shell_name=$1
  printf "\e[31m"                   # Red
  printf "Oh my God! Failed to run because "
  printf "\e[1m$shell_name\e[m"     # Bold
  printf "\e[31m"                   # Red
  printf " is not installed. "
  printf "Please install it!"
  printf "\e[m\n"                   # Normal text
  exit $st
}
zsh --version > /dev/null || exit_for_no_shell zsh
fish --version > /dev/null || exit_for_no_shell fish

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
  printf "\e[32m"
  printf "Login shell has changed! Please relogin to your terminal."
  printf "\e[m\n"
fi

# Deploy rc files.
here_log "Deploy rc files if it has not."
deploy_rc() {
  pattern=$1
  status_line=$($sh_check_deploy_status | grep -F "$pattern")
  if [ $(echo "$status_line" | wc -l) -gt 1 ]; then
    printf "\e[31m"                 # Red
    printf "Oh no! I don't know which is the right "
    printf "\e[1m$pattern\e[m"      # Bold
    printf "\e[31m"                 # Red
    printf " file? Please fix the ambiguous search in me!"
    printf "\e[m\n"                 # Normal text
    exit $code_ambiguous_search
  fi

  if echo "$status_line" | grep 'CONFLICT\e\[m$' > /dev/null ; then
    printf "\e[31m"                 # Red
    printf "Oh my God! Cannot deploy the "
    printf "\e[1m$pattern\e[m"      # Bold
    printf "\e[31m"                 # Red
    printf " file because it conflicts. Please resolve it!"
    printf "\e[m\n"                 # Normal text
    exit $code_conflict
  fi
  $sh_deploy "$pattern"
}
deploy_rc config.fish
deploy_rc fishfile
deploy_rc .zprofile
deploy_rc .zshrc

printf "\e[32m"
printf "Yeah! $my_file_name complete!"
printf "\e[m\n"
