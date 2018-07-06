#!/bin/bash

set -eu

currentdir=$(cd $(dirname $0); pwd)
dotemacsdir="$HOME/.emacs.d"

dotemacsfiles="init.el custom.el snippets"
dotfiles=".zshrc .tmux.conf .gitignore .vimrc"

if [ ! -e $dotemacsdir ]; then
    mkdir $dotemacsdir
fi

# 同名ファイルは2つ作れないので
# ディレクトリを作ってその中で作業する
# （いらないかも）
if [ ! -e ./tmp ]; then
    mkdir ./tmp
fi
cd ./tmp

for file in $dotemacsfiles
do
    if [ ! -e $dotemacsdir/$file ]; then
        echo "--- make $file link ---"
        ln -s $currentdir/$file $file
        mv $file $dotemacsdir/$file
        echo "OK."
        echo "-----------------------"
        echo ""
    fi
done

for file in $dotfiles
do
    if [ ! -e $HOME/$file ]; then
        echo "--- make $file ---"
        ln -s $currentdir/$file $file
        mv $file $HOME/$file
        echo "OK."
        echo "-----------------------"
        echo ""
    fi
done

git config --global core.exculdesfile $HOME/.gitignore

echo "\done!/"
