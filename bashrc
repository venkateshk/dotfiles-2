# if not running interactively, don't do anything
if [ -z "$PS1" ]; then
   return
fi

source /etc/bashrc
source ~/dev/dotfiles/scripts/mktouch.txt

# mac
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

# rakeg stands for rake with growl notification
# Usage: rakeg test
# http://github.com/porras/rakegrowl
alias rakeg='rake -rubygems -r rakegrowl'

# rails
alias sc=' ruby script/console'
#alias rdbm='rake db:migrate && rake db:test:prepare'

# svn
alias svndm='svn diff | mate'

# git
alias gitdm='git diff | mate'
alias gitdm2='git diff --cached | mate'
alias gits='git status'
alias gitcm='git commit -m'
alias gitlog='git --no-pager  log -n 20 --pretty=format:%h%x09%an%x09%ad%x09%s --date=short --no-merges'
alias gitb='git branch -v'
alias gitcd='git add .;gitcm "done"'


#tail
alias taild='tail -f log/development.log'
alias tailt='tail -f log/test.log'
alias taily='tail -f log/yell.log'

#alias mate='open -a TextMate.app'

# MySQL
#alias start_mysql='sudo mysqld_safe --user=mysql &'

# GENERAL
alias home='cd ~' # tilda is too hard to reach
alias ls='ls -G'
alias h='history'
alias ..='cd ..' # move up 1 directory
alias ...='cd ../..' #  move up 2 directories
alias dns_flush='dscacheutil -flushcache'

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

export EDITOR='/usr/local/bin/mate -w'
export SVN_EDITOR='/usr/local/bin/mate -w'
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


alias webshare='ruby -e "require\"webrick\";w=WEBrick::HTTPServer.new(:Port=>8000,:DocumentRoot=>Dir::pwd);Signal.trap(2){w.shutdown};w.start"'

# MacPorts Installer addition on 2009-12-10_at_22:22:22: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

if [[ -s /Users/nsingh/.rvm/scripts/rvm ]] ; then source /Users/nsingh/.rvm/scripts/rvm ; fi  

# quick directories
alias t3='ruby /Users/nsingh/dev/working/t3/bin/t3client.rb'
alias scriptsd='cd /Users/nsingh/dev/dotfiles/scripts'
alias ttd='cd /Users/nsingh/dev/working/tech_tracker'
alias blogd='cd /Users/nsingh/dev/working/blog'
alias t3d='cd /Users/nsingh/dev/working/t3server'
alias insyncd='cd /Users/nsingh/dev/working/insync'
alias kite_runnerd='cd /Users/nsingh/dev/working/kite_runner'
alias jqueryd='cd /Users/nsingh/dev/working/jquery'
alias gitlabd='cd /Users/nsingh/dev/working/gitlab'
alias jquery_labd='cd /Users/nsingh/dev/working/jquery_lab'
alias admin_datad='cd /Users/nsingh/dev/working/admin_data'
alias admin_data_demod='cd /Users/nsingh/dev/working/admin_data_demo'
alias workingd='cd /Users/nsingh/dev/working'
alias dotfilesd='cd /Users/nsingh/dev/dotfiles'
alias guidesd='cd /Users/nsingh/dev/working/guides'
alias eiid='cd /Users/nsingh/dev/eii/eii'
alias scratchd='cd /Users/nsingh/dev/scratch'
alias devd='cd /Users/nsingh/dev'
alias demod='cd /Users/nsingh/dev/scratch/demo'
alias workd='cd /Users/nsingh/dev/work'
alias scrapbookd='cd /Users/nsingh/Library/Application\ Support/Firefox/Profiles/b0bla48s.default/ScrapBook/data'
alias rubyd='cd /System/Library/Frameworks/Ruby.framework/Versions/1.8'
alias javascript_labd='cd /Users/nsingh/dev/working/javascript_lab'
alias vimd='cd /Users/nsingh/dev/vim'
alias noded='cd /Users/nsingh/dev/scratch/node'
alias railsd='cd /Users/nsingh/dev/scratch/rails'
alias bundle_vendor='bundle install vendor --disable-shared-gems'
alias node-repl="rlwrap node-repl"
alias rvm18="rvm use ruby-1.8.7"
alias rc="rails console --debugger"
alias rs="rails s"
alias railstd='cd /Users/nsingh/dev/working/rails_tickets'

alias hg='history | grep $1'
alias sls='screen -ls'

function ss {
  if [ -d "./log" ]; then
    for file in $(find ./log -maxdepth 1 -type f)
    do
      cat /dev/null > $file
    done
  fi

  if [ -d "./tmp" ]; then
    for file in $(find ./tmp -maxdepth 1 -type  f)
    do
      rm $file
    done
  fi


  rm -rf coverage
  rm -f coverage.data

  if [ -e "./script/server" ]; then
    ./script/server
  fi

  if [ -e "./script/rails" ]; then
    ./script/rails server
  fi
}

function sc {
  if [ -e "./script/console" ]; then
    ./script/console
  fi

  if [ -e "./script/rails" ]; then
    ./script/rails console
  fi
}

