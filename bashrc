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

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

. "/Users/nsingh/Dropbox/dotfiles/bashrc_ext/ssl.sh"
. "/Users/nsingh/Dropbox/dotfiles/aliases/elastic_search_aliases.sh"
. "/Users/nsingh/Dropbox/dotfiles/aliases/misc_aliases.sh"          
. "/Users/nsingh/Dropbox/dotfiles/aliases/rails_aliases.sh"
. "/Users/nsingh/Dropbox/dotfiles/aliases/git_aliases.sh"            
. "/Users/nsingh/Dropbox/dotfiles/bashrc_ext/command_prompt.sh"
. "/Users/nsingh/Dropbox/dotfiles/bashrc_ext/rails_commands.sh"
. "/Users/nsingh/Dropbox/dotfiles/bashrc_ext/add_dotfile_scripts_to_path.sh"

# Add git command line completion to git
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
