#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

# dotfiles directory
export dir=~/SparkleShare/dotfiles
# old dotfiles backup directory
export olddir=~/dotfiles_old
# list of files/folders to symlink in homedir
folders="git gnupg ssh zsh"
##########

# create dotfiles_old in homedir
[ ! -d ${olddir} ] && echo -n "Creating ${olddir} for backup of any existing dotfiles" && mkdir -p ${olddir}

# change to the dotfiles directory
if [ ! -d ${dir} ] ; then
  echo "${dir} does not exists, aborting"
else
  cd ${dir}

  # run all available install-skripts
  for folder in $folders; do
    if [ -e ${dir}/${folder}/install.sh ] ; then
      if [ ! -x ${dir}/${folder}/install.sh ] ; then
        echo "making ${folder}/install.sh executable"
        chmod +x ${dir}/${folder}/install.sh
      fi
      echo ${folder}
      ${dir}/${folder}/install.sh
    fi
  done
fi

