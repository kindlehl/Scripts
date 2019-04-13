#!/bin/bash

if ! [ -d ~/bin ]; then
  mkdir ~/bin
fi

if ! [ -d ~/.setup ]; then
  git clone https://github.com/kindlehl/shell ~/.setup
fi

cd ~/.setup

# This should NEVER overwrite local changes.
git checkout master
git pull

ls

# copy scripts and this setup script into my personal bin
cp ./scripts/* ~/bin

# update dotfiles
cp ~/.setup/vimrc ~/.vimrc
cp ~/.setup/zshrc ~/.zshrc
cp -R ~/.setup/refined ~/.oh-my-zsh/themes/refined
