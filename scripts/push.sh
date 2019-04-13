#!/bin/bash

cd ~/.setup

git reset HEAD --hard
git checkout master
git pull

# copy bin into scripts
cp ~/bin/* ./scripts

# update dotfiles
cp ~/.vimrc ~/.setup/vimrc
cp ~/.zshrc ~/.setup/zshrc
cp ~/.oh-my-zsh/themes/refined.zsh-theme ~/.setup/refined.zsh-theme

git add --all
git commit -m "Update from $(date '+%F at %r')"
git push origin master
