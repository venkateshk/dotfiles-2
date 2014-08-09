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

# this is needed otherwise pg_dump that is shipped with OSX is activated first
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

PATH="/Users/nsingh/code/bigbinary_llc/tiny_scripts:$PATH"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/share/npm/bin:$PATH"
