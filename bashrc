# if not running interactively, don't do anything
if [ -z "$PS1" ]; then
   return
fi

source /etc/bashrc

# Don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# This is so that for git merge default message is used and editor is not opened
GIT_MERGE_AUTOEDIT=no
export GIT_MERGE_AUTOEDIT

# this is needed otherwise pg_dump that is shipped with OSX is activated first
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

. "/Users/nsingh/Dropbox/dotfiles/bashrc_ext/ssl.sh"
. "/Users/nsingh/Dropbox/dotfiles/aliases/elastic_search_aliases.sh"
. "/Users/nsingh/Dropbox/dotfiles/aliases/misc_aliases.sh"          
. "/Users/nsingh/Dropbox/dotfiles/aliases/rails_aliases.sh"
. "/Users/nsingh/Dropbox/dotfiles/aliases/git_aliases.sh"            
. "/Users/nsingh/Dropbox/dotfiles/aliases/mysql_aliases.sh"          
. "/Users/nsingh/Dropbox/dotfiles/aliases/redis_aliases.sh"
. "/Users/nsingh/Dropbox/dotfiles/bashrc_ext/command_prompt.sh"
. "/Users/nsingh/Dropbox/dotfiles/bashrc_ext/rails_commands.sh"
. "/Users/nsingh/Dropbox/dotfiles/bashrc_ext/add_dotfile_scripts_to_path.sh"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

export GIT_EDITOR='mvim  -g -f '
export BUNDLE_EDITOR='mvim  -g '
export EDITOR='mvim  -g '


# Add git command line completion to git
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# load bashmarks
source ~/.local/bin/bashmarks.sh

export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/share/npm/bin:$PATH"



### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

