### Installing ruby and setting up machine

```
cd ~
mkdir code
cd code
git clone https://github.com/neerajdotname/dotfiles
cd dotfiles
rake machine:initial_check
rake machine:rbenv
rake machine:brew
rake machine:setup
```

### Installing postgresql server

http://postgresapp.com is the easiest way to get started with postgresql
server.

### How to add custom bash script

Please read [personal/bashrc.example](https://github.com/neerajdotname/dotfiles/blob/master/personal/bashrc.example) . I have following code in my
persona/bashrc file

```
export GIT_EDITOR='mvim  -g -f '
export BUNDLE_EDITOR='mvim  -g '
export EDITOR='mvim  -g '
```

You should add whatever you want to your personal/bashrc to customize or
to override the values in ~/.bashrc

### Do not change ~/.bashrc directly

Every time you run rake command then ~/.bashrc file is regenerated. So
do not change anything at ~/.bashrc directly. In stead add whatever you
want to add to your personal/bashrc .
