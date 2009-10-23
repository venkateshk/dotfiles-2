# if not running interactively, don't do anything
if [ -z "$PS1" ]; then
   return
fi

source /etc/bashrc
source ~/scripts/mktouch.txt
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

# Usage: finder abc.html xyz.pdf
alias finder="open -a finder.app ."


alias sc=' ruby script/console'

# slicehost boxes
alias ssh_eii='ssh www.eventsinindia.com'
alias ssh_blog='ssh nkumar@67.207.136.195 -p 30000'
alias ssh_pageaxis='ssh nsingh@67.207.136.78 -p 30000'

# svn
alias svndm='svn diff | mate'

# git
alias gitdm='git diff | mate'
alias gits='git status'
alias gitcm='git commit -m'
alias gitlog='git log -n 20 --pretty=oneline'
alias gitb='git show-branch'

alias tree='/usr/nkumar/tree'

# quick directories
alias t3='ruby /Users/nkumar/dev/working/t3/bin/t3client.rb'
alias scriptsd='cd /Users/nkumar/scripts'
alias t3d='cd /Users/nkumar/dev/working/t3server'
alias roll_my_blogd='cd /Users/nkumar/dev/working/roll_my_blog'
alias kite_runnerd='cd /Users/nkumar/dev/working/kite_runner'
alias admin_datad='cd /Users/nkumar/dev/working/admin_data'
alias workingd='cd /Users/nkumar/dev/working'
alias guidesd='cd /Users/nkumar/dev/working/guides'
alias opensourced='cd /Users/nkumar/dev/opensource'
alias eiid='cd /Users/nkumar/dev/eii/eii'
alias csd='cd /Users/nkumar/work/community_service_git'
alias asd='cd /Users/nkumar/work/account_service'
alias scratchd='cd /Users/nkumar/dev/scratch'
alias devd='cd /Users/nkumar/dev'
alias demod='cd /Users/nkumar/dev/scratch/demo'
alias workd='cd /Users/nkumar/work'
alias scrapbookd='cd /Users/nkumar/Library/Application\ Support/Firefox/Profiles/b0bla48s.default/ScrapBook/data'
alias rubyd='cd /System/Library/Frameworks/Ruby.framework/Versions/1.8'
alias jschatd='cd /Users/nkumar/dev/scratch/jschat'
alias insyncd='cd /Users/nkumar/dev/working/insync'
alias javascript_labd='cd /Users/nkumar/dev/working/javascript_lab'
alias vimd='cd /Users/nkumar/dev/working/vim'
alias admin_data_labd='cd /Users/nkumar/dev/working/admin_data_lab'

#tail
alias taild='tail -f log/development.log'
alias tailt='tail -f log/test.log'
alias taily='tail -f log/yell.log'

alias rdbm='rake db:migrate && rake db:test:prepare'

alias rsdl='rake rs:sample_data:load'

# MySQL
alias start_mysql='sudo mysqld_safe --user=mysql &'

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

#Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export PATH=$PATH:/Users/nkumar/scripts
export PATH="/usr/local/bin:$PATH"
export EDITOR='/usr/bin/mate -w'
export SVN_EDITOR='/usr/bin/mate -w'

# configure command prompt
#export PS1="\n\[\e[36;1m\]\u:\w\n> \[\e[0m\]" 

# \n: newline
# \u : the username of the current user
# \w : the current working directory, with $HOME abbreviated with a tilde
# \e : an ASCII escape character (033)
# In this case \e[ starts the color scheme
# 36;1m color pair to use
# \] end of color scheme
export PS1="\[\033[38m\]\u@\[\033[01;34m\] \w \[\033[31m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]$\[\033[00m\] \n> "
