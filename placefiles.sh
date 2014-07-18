#!/bin/bash

currentdir=~/dotfiles

mkdir ./tmp
cd ./tmp

ln -s $currentdir/init.el init.el
mv init.el ~/.emacs.d/

ln -s $currentdir/Cask Cask
mv Cask ~/.emacs.d/Cask

ln -s $currentdir/.zshrc .zshrc
mv .zshrc ~/

ln -s $currentdir/.tmux.conf .tmux.conf
mv .tmux.conf ~/
