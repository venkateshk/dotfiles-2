
alias mysql_start='mysql.server start'

alias ls='ls -G'

alias h='history'
#alias hg='history | grep $1'

alias ..='cd ..' # move up 1 directory
alias ...='cd ../..' #  move up 2 directories
alias ....='cd ../../..' #  move up 3 directories
alias .....='cd ../../../..' #  move up 4 directories
alias ......='cd ../../../../..' #  move up 5 directories

# mac
alias mvim='mvim -g'

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
alias ar="cd /Users/nsingh/dev/rails_edge/rails/activerecord/lib/active_record"

alias gphm='git push heroku master'


function start_elasticsearch {
  echo "elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml"
  elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml
}


#
#To have launchd start redis at login:
# ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
# Then to load redis now:
#   launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
# Or, if you don't want/need launchctl, you can just run:
#    redis-server /usr/local/etc/redis.conf
alias start_redis="redis-server /usr/local/etc/redis.conf"
