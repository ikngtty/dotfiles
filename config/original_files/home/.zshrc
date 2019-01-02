# Prompt
# PROMPT='%F{white}(%?)%f
# %F{magenta}%n %# [%d]%f
# $ '

# NOTE: These lines are added automatically.
# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

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
## The description is shown by `hub alias zsh`.
which hub >/dev/null 2>&1 && eval "$(hub alias -s zsh)"

# Completion
## Add.
fpath=(/usr/local/share/zsh-completions $fpath)
## Enable.
autoload -Uz compinit && compinit

# Greeting
## The cow says a quotation chosen at random.
cowfile=`ls /usr/local/Cellar/cowsay/3.04/share/cows | grep '\.cow$' | shuf -n1 | sed 's/\.cow$//'`
fortune | cowsay -f $cowfile
echo $cowfile
