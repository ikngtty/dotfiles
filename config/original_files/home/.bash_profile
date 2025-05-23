# PATH
PATH="usr/local/sbin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
GOPATH="$HOME/Projects"
export GOPATH
PATH="$GOPATH/bin:$PATH"
if which go >/dev/null 2>&1;then
  PATH="$(go env GOROOT)/bin:$PATH"
fi
PATH="$HOME/.nodebrew/current/bin:$PATH"
PATH="/Applications/Racket v7.1/bin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/sqlite/bin:$PATH"
PATH="$HOME/.codeium/windsurf/bin:$PATH"
export PATH
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH

# Other environment values
EDITOR=atom
export EDITOR
PIPENV_VENV_IN_PROJECT=1
export PIPENV_VENV_IN_PROJECT

# Others
which rbenv >/dev/null 2>&1 && eval "$(rbenv init -)"
which pyenv >/dev/null 2>&1 && eval "$(pyenv init --path)"

# Call ".bashrc".
[ -e "$HOME/.bashrc" ] && source "$HOME/.bashrc"
