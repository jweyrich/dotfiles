#!/bin/bash
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp -i .vimrc ~/
vim +PluginInstall +qalla
