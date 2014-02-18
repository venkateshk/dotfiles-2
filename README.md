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
