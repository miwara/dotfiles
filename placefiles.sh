#!/bin/bash

set -eu

currentdir=$(cd $(dirname $0); pwd)

if [ ! -e ./tmp ]; then
    mkdir ./tmp
fi
cd ./tmp

if [ ! -e $HOME/.emacs.d/ ]; then
    mkdir $HOME/.emacs.d/
fi

echo "--- make init.el link ---"
if [ ! -e $HOME/.emacs.d/init.el ]; then
    ln -s $currentdir/init.el init.el
    mv init.el $HOME/.emacs.d/
    echo "OK."
else
    echo "File already exists."
    echo "...skip"
fi
echo "-----------------------"
echo ""

echo "--- make Cask link ---"
if [ ! -e $HOME/.emacs.d/Cask ]; then
    ln -s $currentdir/Cask Cask
    mv Cask $HOME/.emacs.d/Cask
    echo "OK."
else
    echo "File already exists."
    echo "...skip"
fi
echo "-----------------------"
echo ""

echo "--- make .zshrc ---"
if [ ! -e $HOME/.zshrc ]; then
    ln -s $currentdir/.zshrc .zshrc
    mv .zshrc $HOME/
    echo "OK."
else
    echo "File already exists."
    echo "...skip"
fi
echo "-----------------------"
echo ""

echo "--- make .tmux.conf link ---"
if [ ! -e $HOME/.tmux.conf ]; then
    ln -s $currentdir/.tmux.conf .tmux.conf
    mv .tmux.conf $HOME/
    echo "OK."
else
    echo "File already exists."
    echo "...skip"
fi
echo "-----------------------"
echo ""

echo "--- make .gitignore link ---"
if [ ! -e $HOME/.gitignore ]; then
    ln -s $currentdir/.gitignore .gitignore
    mv .gitignore $HOME/
    git config --global core.exculdesfile $HOME/.gitignore
    echo "OK."
else
    echo "File already exists."
    echo "...skip"
fi
echo "-----------------------"
echo ""

echo "\complete!/"
