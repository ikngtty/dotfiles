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
alias d='docker'
alias dc='docker-compose'
alias g='git'
alias r='rails'
alias relogin='exec $SHELL -l'
alias rocaml='rlwrap ocaml'
alias v='vagrant'

# Greeting
echo "This is Bash."
