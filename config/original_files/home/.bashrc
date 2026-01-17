# Prompt
PS1='$(st=$?
  if [ $st -eq 0 ]; then
    printf "\e[37m"
  else
    printf "\e[31;1m"
  fi
  echo "($st)\e[m"
)
\e[35m[\u@\h \W]\e[m
\$ '

# Alias
alias relogin='exec $SHELL -l'
alias b='bundle'
alias be='bundle exec'
alias ber='bundle exec rails'
alias c='cargo'
alias d='docker'
alias dc='docker compose'
alias g='git'
alias ghq-cd='cd "$(ghq list -p | fzf)"'
alias pe='pipenv'
alias r='rails'
alias relogin='exec $SHELL -l'
alias rl='rlwrap'
alias v='vagrant'

# Completion
which pipenv >/dev/null 2>&1 && eval "$(_PIPENV_COMPLETE=bash_source pipenv)"
## Enable autocompletion and all subcommands.
which pyenv >/dev/null 2>&1 && eval "$(pyenv init -)"

# Greeting
echo "This is Bash."

# added by travis gem
[ -f /Users/ikngtty/.travis/travis.sh ] && source /Users/ikngtty/.travis/travis.sh
