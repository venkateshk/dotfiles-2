# Installing new machine

```
# install brew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# download and install xcode
<!--https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12-->

xcode-select --install

brew install git
brew install git bash-completion
brew install automake

if getting the error make: /usr/bin/gcc-4.2: No such file or directory in mountain lion
sudo ln -s /usr/bin/gcc /usr/bin/gcc-4.2
```

# Setting up dotfiles

```
cd /Users/nsingh/dev/personal
git clone git@github.com:neerajdotname/dotfiles.git
cd dotfiles
cp gitconfig.example giconfig

brew install hub

cd /Users/nsingh/dev/personal
follow readme at https://github.com/huyng/bashmarks
ln -s ~/Dropbox/.sdirs .sdirs

# install Xcode.app at the very end
brew install macvim --override-system-vim
```
  

# Setup following softlinks

```
cd ~
ln -s /Users/nsingh/dev/personal/dotfiles/vimrc.after .vimrc.after
ln -s /Users/nsingh/dev/personal/dotfiles/ackrc .ackrc

ln -s /Users/nsingh/dev/personal/dotfiles/bash_profile .bash_profile
ln -s /Users/nsingh/dev/personal/dotfiles/bashrc .bashrc
ln -s /Users/nsingh/dev/personal/dotfiles/gemrc .gemrc
ln -s /Users/nsingh/dev/personal/dotfiles/gitconfig .gitconfig

ln -s /Users/nsingh/dev/personal/dotfiles/irbrc .irbrc
ln -s /Users/nsingh/dev/personal/dotfiles/autotest .autotest

ln -s /Users/nsingh/dev/personal/dotfiles/gvimrc .gvimrc
ln -s /Users/nsingh/dev/personal/dotfiles/vimrc .vimrc

ln -s /Users/nsingh/dev/personal/dotfiles/gvimrc.before .gvimrc.before
```

# How to update to latest janus

```
cd ~/.vim
rake
```


# Why gitconfig is excluded

Because it has token.
