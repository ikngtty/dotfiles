# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
if prompt -l | grep -q spaceship; then
  prompt spaceship
else
  PROMPT='%F{white}(%?)%f
%F{magenta}%n %# [%d]%f
$ '
fi

# Alias
alias relogin='exec $SHELL -l'
alias b='bundle'
alias be='bundle exec'
alias ber='bundle exec rails'
alias c='cargo'
alias d='docker'
alias dc='docker compose'
alias g='git'
alias pe='pipenv'
alias r='rails'
alias relogin='exec $SHELL -l'
alias rl='rlwrap'
alias v='vagrant'
## The description is shown by `hub alias zsh`.
which hub >/dev/null 2>&1 && eval "$(hub alias -s zsh)"

# Completion
which pipenv >/dev/null 2>&1 && eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"
## Enable autocompletion and all subcommands.
which pyenv >/dev/null 2>&1 && eval "$(pyenv init -)"
## Add.
fpath=(/usr/local/share/zsh-completions $fpath)
## Enable.
autoload -Uz compinit && compinit

# Greeting
## The cow says a quotation chosen at random.
if [ -d /usr/local/Cellar/cowsay/3.04_1/share/cows ]; then
  cowfile=`ls /usr/local/Cellar/cowsay/3.04_1/share/cows | grep '\.cow$' | shuf -n1 | sed 's/\.cow$//'`
  fortune | cowsay -f $cowfile
  echo $cowfile
fi

# added by travis gem
[ -f /Users/ikngtty/.travis/travis.sh ] && source /Users/ikngtty/.travis/travis.sh
