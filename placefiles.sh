#!/bin/bash

currentdir=$HOME/dotfiles

if [ ! -e ./tmp ]; then
    mkdir ./tmp
fi
cd ./tmp

ln -s $currentdir/init.el init.el
mv init.el $HOME/.emacs.d/

ln -s $currentdir/Cask Cask
mv Cask $HOME/.emacs.d/Cask

#ln -s $currentdir/.emacs.d .emacs.d
#mv .emacs.d $HOME/

ln -s $currentdir/.zshrc .zshrc
mv .zshrc $HOME/

ln -s $currentdir/.tmux.conf .tmux.conf
mv .tmux.conf $HOME/
