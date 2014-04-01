#!/bin/zsh

# Clone my oh-my-zsh repository from GitHub only if it isn't already present
if [[ ! -d ~/.zprezto/ ]]; then
  git clone --recursive https://github.com/cnlpete/prezto.git "~/.zprezto"
fi

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  [ ! -L "${ZDOTDIR:-$HOME}/.${rcfile:t}" ] && ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

setopt EXTENDED_GLOB
for rcfile in "${dir}"/zsh/^install.sh(.N); do
  [ ! -L "${ZDOTDIR:-$HOME}/.${rcfile:t}" ] && ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

