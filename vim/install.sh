#!/bin/bash
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp -i .vimrc ~/
vim +PluginInstall +qall

if [ ! -z $(which pip3) ]; then HAS_PIP=true; fi

# powerline-status for Vim
if [ "$HAS_PIP" == true ]; then
	if [ "$INSTALLED_POWERLINE_STATUS" != true ]; then
		echo "Installing powerline-status..."
		pip3 install --user powerline-status && INSTALLED_POWERLINE_STATUS=true
	fi
fi