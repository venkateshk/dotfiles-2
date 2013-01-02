# any shell variables defined in ~/.bashrc are not
# available to subshell without export statement
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source ~/.bashrc
