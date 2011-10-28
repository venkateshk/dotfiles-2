# Setup

    cp gitconfig.example giconfig
    cd ~/dev
    git clone git@github.com:neerajdotname/dotfiles.git


# Setup following softlinks

    cd ~
    ln -s /Users/nsingh/dev/dotfiles/bash_profile .bash_profile
    ln -s /Users/nsingh/dev/dotfiles/bashrc .bashrc
    ln -s /Users/nsingh/dev/dotfiles/gitconfig .gitconfig
    ln -s /Users/nsingh/dev/dotfiles/ackrc .ackrc
    ln -s /Users/nsingh/dev/dotfiles/irbrc .irbrc
    ln -s /Users/nsingh/dev/dotfiles/autotest .autotest
    ln -s /Users/nsingh/dev/dotfiles/gemrc .gemrc

# Whey gitconfig is excluded

Because it has token.
