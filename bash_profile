# if not running interactively, don't do anything
if [ -z "$PS1" ]; then
   return
fi

source /etc/bashrc
source ~/dev/dotfiles/scripts/mktouch.txt

# mac
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

# rails
alias sc=' ruby script/console'
alias rdbm='rake db:migrate && rake db:test:prepare'

# slicehost boxes
alias ssh_eii='ssh www.eventsinindia.com'

# svn
alias svndm='svn diff | mate'

# git
alias gitdm='git diff | mate'
alias gits='git status'
alias gitcm='git commit -m'
alias gitlog='git log -n 20 --pretty=oneline'
alias gitb='git show-branch'

# quick directories
alias t3='ruby /Users/nsingh/dev/working/t3/bin/t3client.rb'
alias scriptsd='cd /Users/nsingh/dev/scripts'
alias t3d='cd /Users/nsingh/dev/working/t3server'
alias kite_runnerd='cd /Users/nsingh/dev/working/kite_runner'
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

#tail
alias taild='tail -f log/development.log'
alias tailt='tail -f log/test.log'
alias taily='tail -f log/yell.log'

# MySQL
#alias start_mysql='sudo mysqld_safe --user=mysql &'

# GENERAL
alias home='cd ~' # tilda is too hard to reach
alias l='ls -lah' # l for list style, a for all including hidden, h for human readable file size
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
export EDITOR='/usr/bin/mate -w'
export SVN_EDITOR='/usr/bin/mate -w'


# configure command prompt
#
# \n: newline
# \u : the username of the current user
# \w : the current working directory, with $HOME abbreviated with a tilde
# \e : an ASCII escape character (033)
# In this case \e[ starts the color scheme
# 36;1m color pair to use
# \] end of color scheme
export PS1="\[\033[38m\]\u@\[\033[01;34m\] \w \[\033[31m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]$\[\033[00m\] \n> "

# misc
alias tree='/usr/nsingh/tree'
