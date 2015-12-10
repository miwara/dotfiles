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

dotemacsfiles="init.el Cask snippets"
dotfiles=".zshrc .tmux.conf .gitignore .vimrc"

for file in $dotemacsfiles
do
    echo "--- make $file link ---"
    if [ ! -e $HOME/.emacs.d/$file ]; then
	ln -s $currentdir/$file $file
	mv $file $HOME/.emacs.d/$file
	echo "OK."
    else
	echo "File already exists."
	echo "...skip"
    fi
    echo "-----------------------"
    echo ""
done

for file in $dotfiles
do
    echo "--- make $file ---"
    if [ ! -e $HOME/$file ]; then
	ln -s $currentdir/$file $file
	mv $file $HOME/$file
	echo "OK."
    else
	echo "File already exists."
	echo "...skip"
    fi
    echo "-----------------------"
    echo ""
done

git config --global core.exculdesfile $HOME/.gitignore

echo "\complete!/"
