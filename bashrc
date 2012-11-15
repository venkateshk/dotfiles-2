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
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/Users/nsingh/dev/personal/dotfiles/scripts:$PATH"

export GEM_OPEN_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g '
export GEMEDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g '
export GIT_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g -f '
export BUNDLE_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g '
export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g '

# add git command line completion to git
source /usr/local/Cellar/git/1.7.3.4/etc/bash_completion.d/git-completion.bash

source /Users/nsingh/dev/personal/bashmarks/bashmarks.sh

export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/share/npm/bin:$PATH"

export PATH="/Users/nsingh/dev/scratch/bundler/lib:$PATH"
export PATH="/Users/nsingh/dev/scratch/bundler:$PATH"

source /Users/nsingh/.rvm/scripts/rvm

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

