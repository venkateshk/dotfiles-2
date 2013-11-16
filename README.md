# Installing new machine

Following steps work in OS X 10.9 .

install dropbox first. Since some of the files are stored in dropbox it
is better if dropbox is already synced and has downloaded the files
before we begin setting up things on the new machine.

# Installing brew

```
# install brew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"


brew install git
brew install git bash-completion
brew install automake
brew install hub

# this is needed for gem install pg to work
brew install postgresql

# this is needed otherwise gem install capybara-webkit  will complain
brew install qt
```

# Setting up dotfiles

```
ln -s ~/Dropbox/.sdirs ~/.sdirs
ln -s ~/Dropbox/.ssh ~/.ssh
ln -s ~/Dropbox/.gitconfig ~/.gitconfig
ln -s ~/Dropbox/.instapusher ~/.instapusher

mkdir ~/dev
mkdir ~/dev/personal

cd /Users/nsingh/dev/personal
git clone git@github.com:neerajdotname/dotfiles.git ~/dev/personal
```

# Configure vim

```
install xcode. macvim needs it.

# install macvim
brew install macvim

# install janus
curl -Lo- https://bit.ly/janus-bootstrap | bash  

ln -s /Users/nsingh/dev/personal/dotfiles/vimrc.after ~/.vimrc.after

ln -s /Users/nsingh/dev/personal/dotfiles/gvimrc.before ~/.gvimrc.before
```

# Install rbenv

```
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
rbenv install 2.0.0-p247
rbenv global 2.0.0-p247
```

# Setup following softlinks

```
ln -s /Users/nsingh/dev/personal/dotfiles/ackrc ~/.ackrc

ln -s /Users/nsingh/dev/personal/dotfiles/bash_profile ~/.bash_profile
ln -s /Users/nsingh/dev/personal/dotfiles/bashrc ~/.bashrc
ln -s /Users/nsingh/dev/personal/dotfiles/gemrc ~/.gemrc

ln -s /Users/nsingh/dev/personal/dotfiles/irbrc ~/.irbrc
ln -s /Users/nsingh/dev/personal/dotfiles/autotest ~/.autotest

```

# How to update to latest janus

```
cd ~/.vim
rake
```

# PostgreSQL

http://postgresapp.com

# Gems

```
gem install bundler
gem install instapusher
```

# Installing rubyracergem

```
brew install apple-gcc42

sudo ln -s /usr/local/Cellar/apple-gcc42/4.2.1-5666.3/bin/gcc-4.2 /usr/bin/gcc 
sudo ln -s /usr/local/Cellar/apple-gcc42/4.2.1-5666.3/bin/g++-4.2 /usr/bin/g++ 
sudo ln -s /usr/local/Cellar/apple-gcc42/4.2.1-5666.3/bin/cpp-4.2 /usr/bin/cpp

brew uninstall v8

gem install libv8

gem install therubyracer


http://stackoverflow.com/questions/19630154/gem-install-therubyracer-v-0-10-2-on-osx-mavericks-not-installing
```

# SSL issue



# References

https://github.com/huyng/bashmarks

ln -s /Users/nsingh/dev/personal/dotfiles/vimrc .vimrc

ln -s /Users/nsingh/dev/personal/dotfiles/gvimrc ~/.gvimrc

if getting the error make: /usr/bin/gcc-4.2: No such file or directory in mountain lion
sudo ln -s /usr/bin/gcc /usr/bin/gcc-4.2
