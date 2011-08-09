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

source ~/dev/dotfiles/scripts/mktouch.txt

# a nice function to send authorized keys to the server
# picked up from deploying rails applications ( pragprog.com)
# Usage: authme 123.45.67.89
function authme {
   ssh $1 'cat >> .ssh/authorized_keys' < ~/.ssh/id_dsa.pub
 }



export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/Users/nsingh/dev/dotfiles/scripts:$PATH"

export PATH="/Users/nsingh/dev/vim/jsl-0.3.0-mac:$PATH"

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"  # for postgres
export PATH="/opt/local/lib/postgresql83/bin:$PATH" # for postgres

#export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g '
#export GIT_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g '
export GEM_OPEN_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g '
export GEMEDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g '
export GIT_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g -f '
export BUNDLE_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g '
export EDITOR='/usr/local/bin/mate -w'
#export GIT_EDITOR='/usr/local/bin/mate -w'


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



# if you are using oracle
#export ORACLE_HOME=/Users/oracle/product/10.2.0/db_1
#PATH=$PATH:$ORACLE_HOME/bin
#export DYLD_LIBRARY_PATH=/Users/oracle/product/10.2.0/db_1/lib


# MacPorts Installer addition on 2009-12-10_at_22:22:22: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# start a server without --debugger option. User ssd if you want to start server with --debugger mode.
function ss {
  if [ -d "./log" ]; then
    for file in $(find ./log -maxdepth 1 -type f)
    do
      cat /dev/null > $file
    done
  fi

  #if [ -d "./tmp" ]; then
    #for file in $(find ./tmp -maxdepth 1 -type  f)
    #do
      #rm $file
    #done
  #fi

  rm -rf coverage
  rm -f coverage.data

  if [ -e "./script/server" ]; then
    ./script/server $1 $2
  fi

  if [ -e "./script/rails" ]; then
    ./script/rails server $1 $2
  fi
}

function ssd {
  if [ -d "./log" ]; then
    for file in $(find ./log -maxdepth 1 -type f)
    do
      cat /dev/null > $file
    done
  fi

  #if [ -d "./tmp" ]; then
    #for file in $(find ./tmp -maxdepth 1 -type  f)
    #do
      #rm $file
    #done
  #fi

  rm -rf coverage
  rm -f coverage.data

  if [ -e "./script/server" ]; then
    ./script/server $1 $2 --debugger
  fi

  if [ -e "./script/rails" ]; then
    ./script/rails server $1 $2 --debugger
  fi
}

function sc {
  if [ -e "./script/console" ]; then
    ./script/console $1 $2
  fi

  if [ -e "./script/rails" ]; then
    ./script/rails console $1 $2
  fi
}

function scd {
  if [ -e "./script/console" ]; then
    ./script/console $1 $2 --debugger
  fi

  if [ -e "./script/rails" ]; then
    ./script/rails console $1 $2 --debugger
  fi
}

function rr {
  if [ -e "./script/console" ]; then
    ./script/runner $1
  fi

  if [ -e "./script/rails" ]; then
    ./script/rails runner $1
  fi
}

# for REE
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# rvm needs this
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then
          source $HOME/.rvm/scripts/rvm
fi

# Following function ensures that in a Rails3 project you just need to do spec or cucumber rather than
# bundle exec cucumber
# Note that need for this can be removed if you do
# bundle install --binstubs
function run_bundler_cmd () {
  if [ -e ./Gemfile ]; then
    echo "bundle exec $@"
    bundle exec $@
  else
    echo "$@"
    $@
  fi
}

function c () {
  if [ $# -eq 0 ]; then
    local cmd="bundle exec cucumber"
  else
    local cmd="bundle exec cucumber $@ --require features"
  fi
  echo $cmd
  eval $cmd
}

function r () {
  if [ $# -eq 0 ]; then
    local cmd="bundle exec rspec spec"
  else
    local cmd="bundle exec rspec $@"
  fi
  echo $cmd
  eval $cmd
}


bundle_commands=(rspec cucumber)
for cmd in ${bundle_commands[*]}
do
  alias $cmd="run_bundler_cmd $cmd"
done


alias mysql_start='mysql.server start'

alias postgresql_stop='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.postgresql83-server.plist'
alias postgresql_start='postgres -D /usr/local/var/postgres'

# quick directories
alias ss3='rails server -p 3010'
alias blogd='cd /Users/nsingh/dev/personal/blog'
alias jqueryd='cd /Users/nsingh/dev/jquery'
alias admin_datad='cd /Users/nsingh/dev/personal/admin_data'
alias admin_data_demod='cd /Users/nsingh/dev/personal/admin_data_demo'
alias dotfilesd='cd /Users/nsingh/dev/dotfiles'
alias guidesd='mvim /Users/nsingh/dev/personal/guides'
alias eiid='cd /Users/nsingh/dev/personal/eii'
alias spreed='cd /Users/nsingh/dev/spree_work/spree'
alias scratchd='cd /Users/nsingh/dev/scratch'
alias devd='cd /Users/nsingh/dev'
alias scrapbookd='cd /Users/nsingh/Library/Application\ Support/Firefox/Profiles/b0bla48s.default/ScrapBook/data'
alias vimd='cd /Users/nsingh/dev/vim'
alias railsd='cd /Users/nsingh/dev/scratch/rails'
alias rdbm='rake db:migrate'
alias docrailsd='cd /Users/nsingh/dev/docrails'
alias node-repl="rlwrap node-repl"
alias rvms="rvm use system;"

# core
alias home='cd ~' # tilda is too hard to reach

alias ls='ls -G'

alias h='history'
alias hg='history | grep $1'

alias ..='cd ..' # move up 1 directory
alias ...='cd ../..' #  move up 2 directories
alias ....='cd ../../..' #  move up 3 directories
alias .....='cd ../../../..' #  move up 4 directories

# mac
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

# git
alias gdiff='git diff | mvim -R  -'
alias gdiff2='git diff --cached | mvim -R  -'
alias gits='git status'
alias gitcmw='git commit -m "wip"'
alias gitcmd='git commit -m "done"'
alias gitlog='git --no-pager  log -n 20 --pretty=format:%h%x09%an%x09%ad%x09%s --date=short --no-merges'
alias gitb='git branch -v'
alias gitcmall='git add .;gitcm "wip"'
alias gitco='git checkout $1'
alias gpom='git push origin master'

#tail
alias taild='tail -f log/development.log'
alias tailt='tail -f log/test.log'
alias taily='tail -f log/yell.log'
alias bi='bundle install'
alias rs='rake spec'
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

alias rvm18="rvm use ree-1.8.7-2010.02"
alias rvm19="rvm use ruby-1.9.2-head"


function rake {
  if [ -e Gemfile ]; then
    bundle exec rake $@
  else
    `which rake` $@
  fi
}


export DYLD_LIBRARY_PATH=/usr/local/oracle/instantclient10_2:$DYLD_LIBRARY_PATH
export SQLPATH=/usr/local/oracle/instantclient10_2
export ORACLE_HOME=/usr/local/oracle/instantclient10_2

alias resque_start='redis-server /usr/local/etc/redis.conf'


alias deploy_splitable_staging="ey deploy -e splitable_staging --app splitable --ref master && rake hoptoad:deploy TO=staging"

alias deploy_splitable_production="ey deploy -e splitable_production --app splitable_production --ref master && rake hoptoad:deploy TO=production"

