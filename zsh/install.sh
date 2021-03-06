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

install_zsh

#run zsh script
/bin/zsh ${dir}/zsh/install_zsh.sh

[ ! -L ~/.zsh_aliases ] && mv ~/.zsh_aliases ${olddir}/zsh_aliases && ln -s ${dir}/zsh/zsh_aliases ~/.zsh_aliases && echo "zsh/aliases"
[ ! -L ~/.zsh_favlist ] && mv ~/.zsh_favlist ${olddir}/zsh_favlist && ln -s ${dir}/zsh/zsh_favlist ~/.zsh_favlist && echo "zsh/favlist"

