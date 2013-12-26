
# git
alias gdiff='git diff | mvim -R  -'
alias gdiff2='git diff --cached | mvim -R  -'
alias gits='git status'
alias gitcmw='git commit -m "wip"'

alias gitlog='git --no-pager log -n 20 --pretty=format:%h%x09%an%x09%ad%x09%s --date=short --no-merges'
#alias gitlog='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'

alias timesheet='git --no-pager log -n 50 --pretty=format:%h%x09%an%x09%ad%x09%s --date=short --no-merges --branches --since=30.days --author=Neeraj'
alias gitb='git branch -v'
alias git_refresh='git fetch upstream;git rebase upstream/master'

alias gp='git push'
alias gphm='git push heroku master'
