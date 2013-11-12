alias rdbm='rake db:migrate'

function remigrate! {
  echo "rake db:drop db:create db:migrate" 
  rake db:drop db:create db:migrate
}

function ss {
  if [ -d "./log" ]; then
    for file in $(find ./log -maxdepth 1 -type f)
    do
      cat /dev/null > $file
    done
  fi

  rm -rf coverage
  rm -f coverage.data

  if [ -e "./Procfile" ]
  then
    foreman start
  else
    bundle exec rails server $1 $2
  fi
}

function sc {
  bundle exec rails console $1 $2
}

function scd {
  if [ -e "./script/console" ]; then
    ./script/console $1 $2 --debugger
  fi

  if [ -e "./script/rails" ]; then
    bundle exec rails console $1 $2 --debugger
  fi
}

bundle_commands=(rspec cucumber guard spork)
for cmd in ${bundle_commands[*]}
do
  alias $cmd="run_bundler_cmd $cmd"
done

#function rake {
  #if [ -e Gemfile ]; then
    #bundle exec rake $@
  #else
    #`which rake` $@
  #fi
#}
