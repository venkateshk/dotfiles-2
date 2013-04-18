
alias mysql_start='mysql.server start'
#alias postgresql_stop='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.postgresql83-server.plist'
#alias postgresql_start='postgres -D /usr/local/var/postgres'
alias pg_start='postgres -D /usr/local/var/postgres &'


alias rdbm='rake db:migrate'

alias ls='ls -G'

alias h='history'
#alias hg='history | grep $1'

alias ..='cd ..' # move up 1 directory
alias ...='cd ../..' #  move up 2 directories
alias ....='cd ../../..' #  move up 3 directories
alias .....='cd ../../../..' #  move up 4 directories
alias ......='cd ../../../../..' #  move up 5 directories

# mac
alias mvim='/usr/local/Cellar/macvim/7.3-66/bin/mvim -g'

# git
alias gdiff='git diff | mvim -R  -'
alias gdiff2='git diff --cached | mvim -R  -'
alias gits='git status'
alias gitcmw='git commit -m "wip"'

alias gitlog='git --no-pager log -n 20 --pretty=format:%h%x09%an%x09%ad%x09%s --date=short --no-merges'
#alias gitlog='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'

alias timesheet='git --no-pager log -n 50 --pretty=format:%h%x09%an%x09%ad%x09%s --date=short --no-merges --branches --since=30.days --author=Neeraj'
alias gitb='git branch -v'
alias gitcmall='git add .;gitcm "wip"'

#tail
alias taild='tail -f log/development.log'
alias tailt='tail -f log/test.log'
alias taily='tail -f log/yell.log'
alias bi='bundle install'
alias e='exit'

alias git_refresh='git fetch upstream;git rebase upstream/master'

# GENERAL
alias dns_flush='dscacheutil -flushcache'
alias v='mvim .'

alias webshare='ruby -e "require\"webrick\";w=WEBrick::HTTPServer.new(:Port=>8000,:DocumentRoot=>Dir::pwd);Signal.trap(2){w.shutdown};w.start"'

alias b="bundle"
alias bi="b install"
alias be="b exec"
alias biv="b install --path vendor"
alias berc="b exec rails console"

alias gphm='git push heroku master'
