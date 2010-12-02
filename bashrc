# if not running interactively, don't do anything
if [ -z "$PS1" ]; then
   return
fi

source /etc/bashrc
source ~/dev/dotfiles/scripts/mktouch.txt

# a nice function to send authorized keys to the server
# picked up from deploying rails applications ( pragprog.com)
# Usage: authme 123.45.67.89
function authme {
   ssh $1 'cat >> .ssh/authorized_keys' < ~/.ssh/id_dsa.pub
 }

#don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/Users/nsingh/dev/dotfiles/scripts:$PATH"
export PATH="/Users/nsingh/dev/vim/jsl-0.3.0-mac:$PATH"

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"  # for postgres
export PATH="/opt/local/lib/postgresql83/bin:$PATH" # for postgres

#export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g '
#export GIT_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g '
export GEM_OPEN_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g '
export BUNDLE_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g '
export EDITOR='/usr/local/bin/mate -w'
export GIT_EDITOR='/usr/local/bin/mate -w'


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
export PS1="\n\[\033[38m\]\u@\[\033[01;34m\] \w \[\033[31m\]\n\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1)')\"\`\[\033[37m\]$\[\033[00m\] "

# if you are using oracle
export ORACLE_HOME=/Users/oracle/product/10.2.0/db_1
PATH=$PATH:$ORACLE_HOME/bin
export DYLD_LIBRARY_PATH=/Users/oracle/product/10.2.0/db_1/lib


# MacPorts Installer addition on 2009-12-10_at_22:22:22: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


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
    ./script/server $1 $2 --debugger
  fi

  if [ -e "./script/rails" ]; then
    ./script/rails server $1 $2 --debugger
  fi
}

function sc {
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

# Usage: t 9999
function t() {
  cd "/Users/nsingh/dev/rails_lighthouse/projects/t_$1"
}

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
bundle_commands=(rspec cucumber)
for cmd in ${bundle_commands[*]}
do
  alias $cmd="run_bundler_cmd $cmd"
done


alias page41d='cd /Users/nsingh/dev/page41'
alias admin_data_testd='cd /Users/nsingh/dev/admin_data_test'

alias mysql_stop='sudo launchctl unload -w /Library/LaunchDaemons/com.mysql.mysqld.plist'
alias mysql_start='sudo launchctl load -w /Library/LaunchDaemons/com.mysql.mysqld.plist'

alias postgresql_stop='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.postgresql83-server.plist'
alias postgresql_start='sudo launchctl load -w /Library/LaunchDaemons/org.macports.postgresql83-server.plist'

# quick directories
alias scriptsd='cd /Users/nsingh/dev/dotfiles/scripts'
alias ttd='cd /Users/nsingh/dev/office/tech_tracker_github'
alias blogd='cd /Users/nsingh/dev/blog'
alias jqueryd='cd /Users/nsingh/dev/jquery'
alias gitlabd='cd /Users/nsingh/dev/gitlab'
alias jquery_labd='cd /Users/nsingh/dev/jquery_lab'
alias admin_datad='cd /Users/nsingh/dev/admin_data'
alias admin_data_demod='cd /Users/nsingh/dev/admin_data_demo'
alias dotfilesd='cd /Users/nsingh/dev/dotfiles'
alias guidesd='mvim /Users/nsingh/dev/guides'
alias eiid='cd /Users/nsingh/dev/eii;rvm system;'
alias scratchd='cd /Users/nsingh/dev/scratch'
alias devd='cd /Users/nsingh/dev'
alias demod='cd /Users/nsingh/dev/scratch/demo'
alias scrapbookd='cd /Users/nsingh/Library/Application\ Support/Firefox/Profiles/b0bla48s.default/ScrapBook/data'
alias rubyd='cd /System/Library/Frameworks/Ruby.framework/Versions/1.8'
alias vimd='cd /Users/nsingh/dev/vim'
alias vim2d='cd /Users/nsingh/dev/vim2'
alias noded='cd /Users/nsingh/dev/scratch/node'
alias railsd='cd /Users/nsingh/dev/rails'
alias rdbm='rake db:migrate'
alias docrailsd='cd /Users/nsingh/dev/docrails'
alias bundle_vendor='bundle install --path vendor'
alias node-repl="rlwrap node-repl"
alias rvm3="rvm use ree@rails3;"
alias rvm2="rvm use ree@rails2;"
alias rvms="rvm use system;"

# core
alias home='cd ~' # tilda is too hard to reach

alias ls='ls -G'

alias h='history'
alias hg='history | grep $1'

alias ..='cd ..' # move up 1 directory
alias ...='cd ../..' #  move up 2 directories
alias ....='cd ../../..' #  move up 3 directories

# mac
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

# git
alias gdiff='git diff | mvim -R  -'
alias gdiff2='git diff --cached | mvim -R  -'
alias gits='git status'
alias gitcm='git commit -m'
alias gitlog='git --no-pager  log -n 20 --pretty=format:%h%x09%an%x09%ad%x09%s --date=short --no-merges'
alias gitb='git branch -v'
alias gitcml='git add .;gitcm ".."'

#tail
alias taild='tail -f log/development.log'
alias tailt='tail -f log/test.log'
alias taily='tail -f log/yell.log'
alias bi='bundle install'


# GENERAL
alias dns_flush='dscacheutil -flushcache'
alias v='mvim .'

alias webshare='ruby -e "require\"webrick\";w=WEBrick::HTTPServer.new(:Port=>8000,:DocumentRoot=>Dir::pwd);Signal.trap(2){w.shutdown};w.start"'
