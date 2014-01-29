# Installing ruby and setting up machine

```
cd ~
mkdir code
cd code
cd dotfiles
git clone https://github.com/neerajdotname/dotfiles
rake machine:initial_check
rake machine:setup
rake machine:rbenv
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

```
if getting the error make: /usr/bin/gcc-4.2: No such file or directory in mountain lion
sudo ln -s /usr/bin/gcc /usr/bin/gcc-4.2
```


echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile

echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
