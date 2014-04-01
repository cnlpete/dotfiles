#!/bin/sh

## install zsh
install_zsh () {
  # Test to see if zshell is installed.  If it is:
  if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Set the default shell to zsh if it isn't currently set to zsh
    if [ ! $(echo $SHELL) = $(which zsh) ]; then
      chsh -s $(which zsh)
    fi
  else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [ $platform = 'Linux' ]; then
      sudo apt-get install zsh
      install_zsh
    # If the platform is OS X, tell the user to install zsh :)
    elif [ $platform = 'Darwin' ]; then
      echo "Please install zsh, then re-run this script!"
      exit
    fi
  fi
}

install_zprezto () {
  # Test to see if zshell is installed.  If it is:
  if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d ~/.zprezto/ ]]; then
      git clone --recursive https://github.com/cnlpete/prezto.git "~/.zprezto"
    fi
  fi
}

install_zsh

## get zprezto
install_zprezto

/bin/zsh install_zsh.sh

