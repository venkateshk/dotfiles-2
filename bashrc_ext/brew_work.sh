#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install Bash 4
brew install bash

# Install wget with IRI support
brew install wget --enable-iri

brew install ack
brew install git
brew install rename
brew install tree
brew install ssh-copy-id

# Remove outdated versions from the cellar
brew cleanup

