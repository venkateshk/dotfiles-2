# Mnemonic: gp for "git push"
# main reason why it exists is to have -u option while pushing. Without that -u option
# hub pull-request -i xxx does not work.
function gp {

  if git rev-parse --git-dir > /dev/null 2>&1 # Current directory is a git repository
  then
    # http://stackoverflow.com/questions/1593051/
    branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
    branch_name="(unnamed branch)"     # detached HEAD
    branch_name=${branch_name##refs/heads/}

    if [ $branch_name == 'master' ] # Disallow shortcut pushing to master
    then
      #echo "Error: You cannot use this command to push to master"
      #echo "If you really want to push to master, use 'git push origin master'."
      git push origin master

    elif [ $branch_name == '(unnamed branch)' ]
    then
      echo "Error: You cannot use this command when you are in detached head mode"
    else
      echo "git push -u origin $branch_name"
      git push -u origin $branch_name "$@"
    fi
  else
    echo "Error: The current directory does not appear to be a git repository"
  fi

}
