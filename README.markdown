# Installing new machine

   brew install git
   brew install git bash-completion
   brew install automake
   
   if getting the error make: /usr/bin/gcc-4.2: No such file or directory in mountain lion
   sudo ln -s /usr/bin/gcc /usr/bin/gcc-4.2
   
   rvm reinstall ruby-1.9.3-p194 --with-gcc=clang
   
   rvm --default use ruby-1.9.3-p194
   

http://railsapps.github.com/openssl-certificate-verify-failed.html


# Setup

    cd /Users/nsingh/dev/personal
    git clone git@github.com:neerajdotname/dotfiles.git
    cd dotfiles
    cp gitconfig.example giconfig
    
    
    
    cd /Users/nsingh/dev/personal
    follow readme at https://github.com/huyng/bashmarks
    
    # install Xcode.app at the very end
    brew install macvim --override-system-vim
      

# Setup following softlinks

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

# Why gitconfig is excluded

Because it has token.
