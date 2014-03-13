#!/bin/bash

[ ! -L ~/.ssh/config ] && mv ~/.ssh/config ${olddir}/ssh.config && ln -s ${dir}/ssh/config ~/.ssh/config && echo "ssh/config"

