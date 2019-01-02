# PATH
GOPATH="$HOME/Projects/workspace/go"
export GOPATH
PATH="$GOPATH/bin:$PATH"
PATH="$(go env GOROOT)/bin:$PATH"
PATH="$HOME/.nodebrew/current/bin:$PATH"
PATH="/Applications/Racket v7.1/bin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH

# Other
which rbenv >/dev/null 2>&1 && eval "$(rbenv init -)"
which pyenv >/dev/null 2>&1 && eval "$(pyenv init -)"

# Call ".bashrc".
[ -e "$HOME/.bashrc" ] && source "$HOME/.bashrc"
