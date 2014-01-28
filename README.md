# Installing new machine

Following steps work in OS X 10.9 .

install dropbox first. Since some of the files are stored in dropbox it
is better if dropbox is already synced and has downloaded the files
before we begin setting up things on the new machine.

# Installing brew

```
# install brew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

# Setting up maching using rake

```
cd ~
mkdir code
cd code
git clone https://github.com/neerajdotname/dotfiles
rake machine:setup
rake machine:rbenv
```

# Installing software using brew

```
brew install imagemagick

# this is needed for gem install pg to work
brew install postgresql

# this is needed otherwise gem install capybara-webkit  will complain
brew install qt
```

# Setting up dotfiles

```
ln -s ~/Dropbox/dotfiles/secret/sdirs ~/.sdirs
ln -s ~/Dropbox/dotfiles/secret/gitconfig ~/.gitconfig
ln -s ~/Dropbox/dotfiles/secret/instapusher ~/.instapusher
ln -s ~/Dropbox/dotfiles/secret/ssh ~/.ssh

mkdir ~/dev
mkdir ~/dev/personal

cd /Users/nsingh/dev/personal
git clone git@github.com:neerajdotname/dotfiles.git ~/dev/personal
```

# Configuring .ssh

```
chmod 600 ~/.ssh/id_rsa
ssh-add -K
```

# Configure vim

```
install xcode. macvim needs it.

# install macvim
brew install macvim

# install janus
curl -Lo- https://bit.ly/janus-bootstrap | bash  

ln -s ~/Dropbox/dotfiles/vimrc.after ~/.vimrc.after

ln -s ~/Dropbox/dotfiles/gvimrc.before ~/.gvimrc.before
```

# Setup following softlinks

```
ln -s ~/Dropbox/dotfiles/irbrc ~/.irbrc
```


# How to update to latest janus

```
cd ~/.vim
rake
```

# PostgreSQL

http://postgresapp.com

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

https://github.com/neerajdotname/dotfiles/blob/master/bashrc_ext/ssl.sh

# References

https://github.com/huyng/bashmarks

ln -s /Users/nsingh/dev/personal/dotfiles/vimrc .vimrc

ln -s /Users/nsingh/dev/personal/dotfiles/gvimrc ~/.gvimrc

if getting the error make: /usr/bin/gcc-4.2: No such file or directory in mountain lion
sudo ln -s /usr/bin/gcc /usr/bin/gcc-4.2


echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

#test rbenv is working or not by opening a new tab and typing
$ type rbenv
#=> "rbenv is a function"
