#!/usr/bin/env bash

echo 'Dotfiles - zener79'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mv $DIR ~/.dotfiles

for DOTFILE in `find ~/.dotfiles/link -maxdepth 1  | sed 1,1d`
do
  ln -sv "$DOTFILE" ~/
done

ln -sv ~/.dotfiles/.bash_profile ~/
source ~/.bash_profile

# Backups, swaps and undos are stored here.
mkdir -p ~/.dotfiles/caches/vim

# Fast directory switching
mkdir -p ~/.dotfiles/caches/z

sudo apt-get -qq update
sudo apt-get -qq install git-core silversearcher-ag tmux vim

# Download Vim plugins.
if [[ "$(type -P vim)" ]]; then
  vim +PlugUpgrade +PlugUpdate +qall
fi