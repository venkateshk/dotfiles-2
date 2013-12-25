# if not running interactively, don't do anything
if [ -z "$PS1" ]; then
   return
fi

# this is needed otherwise pg_dump that is shipped with OSX is activated first
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

source /etc/bashrc

. "/Users/nsingh/Dropbox/dotfiles/bashrc_ext/ssl.sh"

. "/Users/nsingh/Dropbox/dotfiles/aliases/elastic_search_aliases.sh"
. "/Users/nsingh/Dropbox/dotfiles/aliases/misc_aliases.sh"          
. "/Users/nsingh/Dropbox/dotfiles/aliases/rails_aliases.sh"
. "/Users/nsingh/Dropbox/dotfiles/aliases/git_aliases.sh"            
. "/Users/nsingh/Dropbox/dotfiles/aliases/mysql_aliases.sh"          
. "/Users/nsingh/Dropbox/dotfiles/aliases/redis_aliases.sh"


. "/Users/nsingh/Dropbox/dotfiles/bashrc_ext/command_prompt.sh"
. "/Users/nsingh/Dropbox/dotfiles/bashrc_ext/rails_commands.sh"
#. "/Users/nsingh/Dropbox/dotfiles/bashrc_ext/git_commands.sh"
. "/Users/nsingh/Dropbox/dotfiles/bashrc_ext/add_dotfile_scripts_to_path.sh"

#don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

#export GIT_EDITOR='/usr/local/Cellar/macvim/7.3-66/bin/mvim  -g -f '
#export BUNDLE_EDITOR='/usr/local/Cellar/macvim/7.3-66/bin/mvim  -g '
#export EDITOR='mvim  -g '

export GIT_EDITOR='mvim  -g -f '
export BUNDLE_EDITOR='mvim  -g '
export EDITOR='mvim  -g '


# add git command line completion to git
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# load bashmarks
source ~/.local/bin/bashmarks.sh

export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/share/npm/bin:$PATH"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#mysql_start = mysql.server start
#You can start the MySQL daemon with:
#cd /usr/local/opt/mysql ; /usr/local/opt/mysql/bin/mysqld_safe &

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# this is so that for git merge default message is used and editor is not opened
GIT_MERGE_AUTOEDIT=no
export GIT_MERGE_AUTOEDIT
