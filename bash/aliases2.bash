alias mvim='mvim -g'
alias v='mvim .'
alias js="jekyll -w serve"

# http://blog.bigbinary.com/2013/09/13/how-to-keep-your-fork-uptodate.html
#
# useful when you want to bring your local rails repository uptodate with
# rails/rails repository
alias git_refresh='git fetch upstream;git rebase upstream/master'

function inet {
  echo "INSTAPUSHER_HOST=www.instapusher.net /Users/nsingh/code/instapusher_project/instapusher/bin/instapusher --debug"
  INSTAPUSHER_HOST=www.instapusher.net /Users/nsingh/code/instapusher_project/instapusher/bin/instapusher --debug
}

function i2 {
  INSTAPUSHER_HOST=107.170.11.75 API_KEY=9f2cae3d9a9cc8a4a1c0609604c703f7 /Users/nsingh/code/instapusher_project/instapusher2/bin/instapusher2 --debug
}

function it {
  echo "API_KEY=xxx /Users/nsingh/code/instapusher_project/instapusher/bin/instapusher --local --debug"
  API_KEY=xxx /Users/nsingh/code/instapusher_project/instapusher/bin/instapusher --local --debug
}
