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
eval "$(rbenv init -)"
eval "$(pyenv init -)"
