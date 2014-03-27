Dotfiles
========

This repository includes all of my custom dotfiles.
I manage them via [SparkleShare](http://sparkleshare.org/), this way they will keep themselve updated automatically.
If you want to clone them manually, either adjust the variable in `install.sh` or make shure the repo resides in `~/SparkleShare/dotfiles`.

The setup script is smart enough to make a backup of your existing dotfiles into a `~/dotfiles_old/` directory. Afterwards it will basically symlink all the dotfiles to all the appropriate locations.

I also prefer `zsh` as my shell of choice.
As such, the setup script will clone the `zprezto` repository from my GitHub.
It then checks to see if `zsh` is installed.
If `zsh` is installed, and it is not already configured as the default shell, the setup script will execute a `chsh -s $(which zsh)`.
This changes the default shell to zsh, and takes effect as soon as a new zsh is spawned or on next login.

So, to recap, the install script will:

1. Back up any existing dotfiles in your home directory to `~/dotfiles_old/`
2. Create symlinks to the dotfiles in your home directory
3. Clone the `zprezto` repository from my GitHub (for use with `zsh`)
4. Check to see if `zsh` is installed, if it isn't, try to install it.
5. If zsh is installed, run a `chsh -s` to set it as the default shell.

Currently Included:
-------------------

- ssh-config
- gnupg-config
- git-config
- zsh-config

Installation
------------

``` bash
mkdir -p ~/SparkleShare
git clone git://github.com/cnlpete/dotfiles ~/SparkleShare/dotfiles
cd ~/SparkleShare/dotfiles
./install.sh
```
