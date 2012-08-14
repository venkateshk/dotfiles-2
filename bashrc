# if not running interactively, don't do anything
if [ -z "$PS1" ]; then
   return
fi

source /etc/bashrc

#don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/Users/nsingh/dev/personal/dotfiles/scripts:$PATH"

#export PATH="/Users/nsingh/dev/vim/jsl-0.3.0-mac:$PATH"

#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"  # for postgres
#export PATH="/opt/local/lib/postgresql83/bin:$PATH" # for postgres

#export PATH="/usr/local/Cellar/ctags/5.8/bin/ctags:$PATH" # ctags to work

export GEM_OPEN_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g '
export GEMEDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g '
export GIT_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g -f '
export BUNDLE_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g '
export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g '


# configure command prompt
#
# \n: newline
# \u : the username of the current user
# \w : the current working directory, with $HOME abbreviated with a tilde
# \e : an ASCII escape character (033)
# In this case \e[ starts the color scheme
# 36;1m color pair to use
# \] end of color scheme
#export PS1="\[\033[38m\]\u@\[\033[01;34m\] \w \[\033[31m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]$\[\033[00m\] \n$ "
#export PS1="\n\[\033[38m\]\u@\[\033[01;34m\] \w \[\033[31m\]\n\`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1)')\"\`\[\033[37m\]$\[\033[00m\] "

a="\n\[\033[38m\]\u\[\033[01;34m\] \w \[\033[31m\]"
b="\`ruby -e \"print RUBY_VERSION\"\`"
c="\`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1)')\"\`\[\033[37m\]\n"
d="$\[\033[00m\] "
export PS1=$a$b$c$d

# MacPorts Installer addition on 2009-12-10_at_22:22:22: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# start a server without --debugger option. User ssd if you want to start server with --debugger mode.
function ss {
  if [ -d "./log" ]; then
    for file in $(find ./log -maxdepth 1 -type f)
    do
      cat /dev/null > $file
    done
  fi

  rm -rf coverage
  rm -f coverage.data

  if [ -e "./script/server" ]; then
    ./script/server $1 $2
  fi

  if [ -e "./script/rails" ]; then
    bundle exec rails server $1 $2
  fi
}

function sc {
  if [ -e "./script/console" ]; then
    ./script/console $1 $2
  fi

  if [ -e "./script/rails" ]; then
    bundle exec rails console $1 $2
  fi
}

function scd {
  if [ -e "./script/console" ]; then
    ./script/console $1 $2 --debugger
  fi

  if [ -e "./script/rails" ]; then
    bundle exec rails console $1 $2 --debugger
  fi
}

# rvm needs this
#if [[ -s $HOME/.rvm/scripts/rvm ]] ; then
          #source $HOME/.rvm/scripts/rvm
#fi

# Following function ensures that in a Rails3 project you just need to do spec or cucumber rather than
# bundle exec cucumber
# Note that need for this can be removed if you do
# bundle install --binstubs
function run_bundler_cmd () {
  if [ -e ./Gemfile ]; then
    echo "running bundle exec "
    echo "bundle exec $@"
    bundle exec $@
  else
    echo "$@"
    $@
  fi
}

bundle_commands=(rake rspec cucumber guard spork)
for cmd in ${bundle_commands[*]}
do
  alias $cmd="run_bundler_cmd $cmd"
done

#alias mysql_start='mysql.server start'
#alias postgresql_stop='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.postgresql83-server.plist'
#alias postgresql_start='postgres -D /usr/local/var/postgres'
alias pg_start='postgres -D /usr/local/var/postgres &'

# quick directories
alias scratchd='cd /Users/nsingh/dev/scratch'
alias devd='cd /Users/nsingh/dev'
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
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

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


# GENERAL
alias dns_flush='dscacheutil -flushcache'
alias v='mvim .'

alias webshare='ruby -e "require\"webrick\";w=WEBrick::HTTPServer.new(:Port=>8000,:DocumentRoot=>Dir::pwd);Signal.trap(2){w.shutdown};w.start"'

# add git command line completion to git
source /usr/local/Cellar/git/1.7.3.4/etc/bash_completion.d/git-completion.bash

source /Users/nsingh/dev/personal/bashmarks/bashmarks.sh

alias b="bundle"
alias bi="b install"
alias be="b exec"
alias biv="b install --path vendor"

export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/share/npm/bin:$PATH"

function rake {
  if [ -e Gemfile ]; then
    bundle exec rake $@
  else
    `which rake` $@
  fi
}

alias resque_start='redis-server /usr/local/etc/redis.conf'
alias splitable_worker="rake resque:work QUEUE='*'"

alias gphm='git push heroku master'
alias acap='bundle exec rake assets:clean;bundle exec rake assets:precompile'
alias ap='bundle exec rake assets:precompile'
alias gp='git push'
alias rs='bundle exec rake setup --trace'

alias heroku_reset_nimbleshop="heroku pg:reset SHARED_DATABASE_URL --confirm nimbleshopnet; heroku run rake db:migrate --app nimbleshopnet; heroku run rake setup --app nimbleshopnet --trace"

alias heroku_reset_tweli="heroku pg:reset SHARED_DATABASE_URL --confirm tweli-staging; heroku run rake db:migrate --app tweli-staging; heroku run rake setup --app tweli-staging --trace"

alias greadme='git add .; gitcmd; git push'

alias rdbma='rake db:rollback STEP=100; rake setup_development --trace'

alias po='pow open'

export PATH="/Users/nsingh/dev/scratch/bundler/lib:$PATH"
export PATH="/Users/nsingh/dev/scratch/bundler:$PATH"

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
eval "$(rbenv init -)"


source /Users/nsingh/.rvm/scripts/rvm

source /Users/nsingh/dev/neerajdotname/z/z.sh

#PS1='-> '
