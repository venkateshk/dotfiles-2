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

export GIT_EDITOR='mvim  -g -f '
export BUNDLE_EDITOR='mvim  -g '
export EDITOR='mvim  -g '

# Load bashmarks
source ~/.local/bin/bashmarks.sh

source "/Users/nsingh/Dropbox/dotfiles/bash/command_prompt.bash"
source "/Users/nsingh/Dropbox/dotfiles/bash/aliases.bash"
source "/Users/nsingh/Dropbox/dotfiles/bash/aliases2.bash"
source "/Users/nsingh/Dropbox/dotfiles/bash/git_command_line_completion.bash"
source "/Users/nsingh/Dropbox/dotfiles/bash/utility_functions.bash"

# this is needed otherwise pg_dump that is shipped with OSX is activated first
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

export PATH="/Users/nsingh/vagrant-machine/code/bigbinary_llc/tiny_scripts/scripts:$PATH"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/Cellar/smlnj/110.76/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

