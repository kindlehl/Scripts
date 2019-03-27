#!/bin/bash

if ! [ -d ~/bin ]; then
  mkdir ~/bin
fi

if ! [ -d ~/.setup ]; then
  git clone https://github.com/kindlehl/shell ~/.setup
fi

cd ~/.setup

git checkout master
git pull

ls

# copy scripts and this setup script into my personal bin
cp ./scripts/* ~/bin

# update dotfiles
cp ~/.setup/vimrc ~/.vimrc
cp ~/.setup/zshrc ~/.zshrc


# Add crontab. ChUnKyMoNkEy is a unique pattern so this should never fail lol

if ! crontab -l 2>/dev/null | grep ChUnKyMoNkEy; then
  crontab <<EOF
0 * * * * ChUnKyMoNkEy='' $HOME/bin/pull.sh
EOF
fi
