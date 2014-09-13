alias ls='ls -G'

# List only directories
alias lsd='ls -l | grep "^d"'

alias h='history'

alias e='exit'

alias ..='cd ..' # move up 1 directory
alias ...='cd ../..' #  move up 2 directories
alias ....='cd ../../..' #  move up 3 directories
alias .....='cd ../../../..' #  move up 4 directories
alias ......='cd ../../../../..' #  move up 5 directories

alias i='instapusher'

alias gits='git status'
alias gitcmw='git commit -m "wip"'
alias gitlog='git --no-pager log -n 20 --pretty=format:%h%x09%an%x09%ad%x09%s --date=short --no-merges'

alias gitb='git branch -v'
alias gphm='git push heroku master'

alias timesheet='git --no-pager log -n 50 --pretty=format:%h%x09%an%x09%ad%x09%s --date=short --no-merges --branches --since=30.days --author=Neeraj'

alias rdbm='rake db:migrate'
alias bi='bundle install'
alias b="bundle"
alias be="bundle exec"
alias biv="bundle install --path vendor"
