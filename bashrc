# if not running interactively, don't do anything
if [ -z "$PS1" ]; then
   return
fi

source /etc/bashrc

. "/Users/nsingh/dev/personal/dotfiles/bash_aliases"
. "/Users/nsingh/dev/personal/dotfiles/command_prompt"
. "/Users/nsingh/dev/personal/dotfiles/rails_commands"
. "/Users/nsingh/dev/personal/dotfiles/git_commands"

#don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export PATH="/Users/nsingh/dev/personal/dotfiles/scripts:$PATH"

export GIT_EDITOR='/usr/local/Cellar/macvim/7.3-66/bin/mvim  -g -f '
export BUNDLE_EDITOR='/usr/local/Cellar/macvim/7.3-66/bin/mvim  -g '
export EDITOR='/usr/local/Cellar/macvim/7.3-66/bin/mvim  -g '

# add git command line completion to git
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# load bashmarks
source ~/.local/bin/bashmarks.sh

export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/share/npm/bin:$PATH"

#export PATH="/Users/nsingh/dev/scratch/bundler/lib:$PATH"
#export PATH="/Users/nsingh/dev/scratch/bundler:$PATH"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#mysql_start = mysql.server start
#You can start the MySQL daemon with:
#cd /usr/local/opt/mysql ; /usr/local/opt/mysql/bin/mysqld_safe &

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


export SSL_CERT_FILE=/Users/nsingh/dev/personal/dotfiles/cacert.pem

#export RBENV_DEBUG=1
