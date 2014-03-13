#!/bin/bash

[ ! -L ~/.gitconfig ] && mv ~/.gitconfig $olddir/gitconfig && ln -s $dir/git/gitconfig ~/.gitconfig && echo "git/config"

