function warn_if_universal_var \
  -d "Call before adding values to the specified variable in `config.fish`."

  if set -qU $argv
    set_color red
    echo "WARNING: $argv has universal values."
    echo "This may cause the values to increase whenever fish starts."
    set -S $argv
    set_color normal
  end
end

# Set paths
set -gx GOPATH ~/Projects/workspace/go
## PATH
warn_if_universal_var fish_user_paths
set fish_user_paths /usr/local/sbin $fish_user_paths
set fish_user_paths ~/.local/bin $fish_user_paths
set fish_user_paths $GOPATH/bin $fish_user_paths
if which go > /dev/null ^ /dev/null
  set fish_user_paths (go env GOROOT)/bin $fish_user_paths
end
set fish_user_paths ~/.nodebrew/current/bin $fish_user_paths
set fish_user_paths /Applications/Racket\ v7.1/bin $fish_user_paths
set fish_user_paths /usr/local/opt/coreutils/libexec/gnubin $fish_user_paths
## MANPATH
if status --is-interactive
  warn_if_universal_var MANPATH
  if test (count $MANPATH) -eq 0
    # NOTE: To search default paths for `manpath` command,
    # the environment variable MANPATH should end with ':'.
    # So the array MANPATH should end with an empty string item.
    set MANPATH ""
  end
  set MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
end

# Set other environment values
## Limit GHC's heap size somehow.
## haskell-stack cannot run because 1GB heap size is lack.
# set -gx GHCRTS -M1G
## stylish-haskell (and perhaps other tools) cannot run because of
## some GHCRTS value.
## It is likely to work if it is built with "-rtsopts" ghc-options,
## but Stack's "--ghc-options" option seems not to work.
# set -gx GHCRTS -M2G

## Pipenv
set -gx PIPENV_VENV_IN_PROJECT 1
set -gx EDITOR atom

# Init
if status --is-interactive
  which rbenv > /dev/null ^ /dev/null; and rbenv init - | source
  which pyenv > /dev/null ^ /dev/null; and pyenv init - | source
  which direnv > /dev/null ^ /dev/null; and eval (direnv hook fish)
end

# Completions
if status --is-interactive
  which pipenv > /dev/null ^ /dev/null; and eval (pipenv --completion)
end

# Abbreviations
if status --is-interactive
  set -g fish_user_abbreviations
  abbr --add b bundle
  abbr --add d docker
  abbr --add dc docker-compose
  abbr --add g git
  abbr --add pe pipenv
  abbr --add r rails
  abbr --add relogin exec $SHELL -l
  abbr --add rl rlwrap
  abbr --add s stack
  abbr --add v vagrant
end

# Functions
if status --is-interactive
  ## The description is shown by `hub alias fish`.
  function git --wraps hub --description 'Alias for hub, which wraps git to provide extra functionality with GitHub.'
    hub $argv
  end
end

# Fisherman
set -g fisher_path ~/.config/fisher_conf

set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]

for file in $fisher_path/conf.d/*.fish
    builtin source $file ^ /dev/null
end

# bobthefish
if status --is-interactive
  # Fixing a bug in an unofficial way
  builtin source $fisher_path/functions/fish_greeting.fish
  builtin source $fisher_path/functions/fish_mode_prompt.fish
  builtin source $fisher_path/functions/fish_prompt.fish
  builtin source $fisher_path/functions/fish_right_prompt.fish
  builtin source $fisher_path/functions/fish_title.fish

  # Config
  set -g fish_prompt_pwd_dir_length 4
  set -g theme_color_scheme dracula
  set -g theme_display_vagrant yes
  set -g theme_newline_cursor clean
  set -g theme_show_exit_status yes
end

# NOTE: Added automatically by `opam init`(probably)
# opam configuration
source /Users/ikngtty/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# NOTE: Added automatically.
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
