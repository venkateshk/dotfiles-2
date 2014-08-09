### Installing ruby and setting up machine

```
cd ~
mkdir code
cd code
git clone https://github.com/neerajdotname/dotfiles
cd dotfiles

rake machine:initial_check
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
rake machine:rbenv
rake machine:setup
source ~/.bashrc
rake machine:install_ruby
rake machine:brew
```

### Installing postgresql server

http://postgresapp.com is the easiest way to get started with postgresql
server.

### How to add custom bash script

Please read [personal/bashrc.example](https://github.com/neerajdotname/dotfiles/blob/master/personal/bashrc.example) . You should add whatever you want to your personal/bashrc to customize or to override the values in ~/.bashrc .

Just for example I have following code in my personal/bashrc file .

```
export GIT_EDITOR='mvim  -g -f '
export BUNDLE_EDITOR='mvim  -g '
export EDITOR='mvim  -g '
```

### Do not change ~/.bashrc directly

Every time you run rake command then ~/.bashrc file is regenerated. So
do not change anything at ~/.bashrc directly. In stead add whatever you
want to add to your personal/bashrc .

### Terminal app

For terminal app I use "dark theme" of https://github.com/noahfrederick/Hemisu-Terminal-app . After downloading I made following changes
- change font family to "monaco"
- incresed the font size to 16

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
execute_cmd "git config --global core.mergeoptions --no-edit"
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
rbenv global 2.0.0-p247"
gem install bundler"
```

