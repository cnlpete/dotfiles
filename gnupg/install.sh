#!/bin/bash

[ ! -L ~/.gnupg/gpg.conf ] && mv ~/.gnupg/gpg.conf $olddir/gnupg.gpg.conf && ln -s $dir/gnupg/gpg.conf ~/.gnupg/gpg.conf && echo "gnupg/config"

