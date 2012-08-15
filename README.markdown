# Setup

    cp gitconfig.example giconfig
    cd ~/dev/personal
    git clone git@github.com:neerajdotname/dotfiles.git


# Setup following softlinks

    cd ~
    ln -s /Users/nsingh/dev/personal/dotfiles/bash_profile .bash_profile
    ln -s /Users/nsingh/dev/personal/dotfiles/bashrc .bashrc
    ln -s /Users/nsingh/dev/personal/dotfiles/gitconfig .gitconfig
    ln -s /Users/nsingh/dev/personal/dotfiles/ackrc .ackrc
    ln -s /Users/nsingh/dev/personal/dotfiles/irbrc .irbrc
    ln -s /Users/nsingh/dev/personal/dotfiles/autotest .autotest
    ln -s /Users/nsingh/dev/personal/dotfiles/gemrc .gemrc
    ln -s /Users/nsingh/dev/personal/dotfiles/gvimrc .gvimrc
    ln -s /Users/nsingh/dev/personal/dotfiles/vimrc .vimrc
    ln -s /Users/nsingh/dev/personal/dotfiles/vimrc.after .vimrc.after
    ln -s /Users/nsingh/dev/personal/dotfiles/gvimrc.before .gvimrc.before

# Why gitconfig is excluded

Because it has token.
