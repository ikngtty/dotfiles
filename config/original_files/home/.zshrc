# Prompt
PROMPT='%F{white}(%?)%f
%F{magenta}%n %# [%d]%f
$ '

# Alias
alias relogin='exec $SHELL -l'
alias b='bundle'
alias g='git'
alias r='rails'
alias relogin='exec $SHELL -l'
alias rocaml='rlwrap ocaml'
alias v='vagrant'

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
