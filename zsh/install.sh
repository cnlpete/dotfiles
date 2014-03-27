#!/bin/zsh

## install zsh
install_zsh () {
  # Test to see if zshell is installed.  If it is:
  if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/.zprezto/ ]]; then
      git clone --recursive https://github.com/cnlpete/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    fi
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


## get zprezto

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  [ ! -L "${ZDOTDIR:-$HOME}/.${rcfile:t}" ] && ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

setopt EXTENDED_GLOB
for rcfile in "${dir}"/zsh/^install.sh(.N); do
  [ ! -L "${ZDOTDIR:-$HOME}/.${rcfile:t}" ] && ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

