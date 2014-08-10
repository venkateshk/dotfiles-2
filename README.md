### Getting gcc etc

If it is a new machine then execute `xcode-select --install` .

### Installing ruby and setting up machine

``` bash
cd ~/Dropbox/
git clone https://github.com/neerajdotname/dotfiles
cd dotfiles
```

### Install homebrew

``` bash
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

### Setting up bash_profile and bashrc

``` bash
ln -s /Users/nsingh/Dropbox/dotfiles/bash_profile ~/.bash_profile
ln -s /Users/nsingh/Dropbox/dotfiles/bashrc ~/.bashrc
ln -s /Users/nsingh/Dropbox/dotfiles/ackrc ~/.ackrc
```

### Installing PostgreSQL database

[http://postgresapp.com](http://postgresapp.com) is the easiest way to get started with postgresql server.

### Setting up git 

``` bash
git config --global alias.co checkout
git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto
git config --global branch.autosetuprebase always
git config --global push.default current

# Typicall when I merge master into production git opens editor for me to type merge message.
# Personally I do not want git to ask me to enter anything when I am merging a branch into another.
# Following code is to silence git.
git config --global core.mergeoptions --no-edit
```
### Setting up rbenv

``` bash
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
```

### Using rbenv

``` bash
rbenv install 2.0.0-p247
rbenv global 2.0.0-p247
gem install bundler
```

### Terminal app

For terminal app I use "dark theme" of https://github.com/noahfrederick/Hemisu-Terminal-app . After downloading I made following changes
- change font family to "monaco"
- incresed the font size to 16


