#!/bin/bash

cp -i .bash-detect-system.sh ~/
cp -i .bash_colors ~/
cp -i .bashrc ~/
cp -i .inputrc ~/
cp -i .profile ~/
cp -ir bin ~/

if [ ! -z $(brew --prefix) ]; then HAS_HOMEBREW=true; fi
if [ ! -z $(which pip3) ]; then HAS_PIP=true; fi
if [ ! -z $(which npm) ]; then HAS_NPM=true; fi

if [ "$HAS_HOMEBREW" == true ]; then
	echo "Updating homebrew..."
	brew update

	if [ "$INSTALLED_GIT" != true ]; then
		echo "Installing git..."
		brew install git && INSTALLED_GIT=true
	fi
	if [ "$INSTALLED_BASH_COMPLETION" != true ]; then
		echo "Installing bash-completion..."
		brew install bash-completion && INSTALLED_BASH_COMPLETION=true
	fi
	if [ "$INSTALLED_DIFFSOFANCY" != true ]; then
		echo "Installing diff-so-fancy..."
		brew install diff-so-fancy && INSTALLED_DIFFSOFANCY=true
	fi
fi

if [ "$HAS_PIP" == true ]; then
	if [ "$INSTALLED_POWERLINE_STATUS" != true ]; then
		echo "Installing powerline-status..."
		pip3 install --user powerline-status && INSTALLED_POWERLINE_STATUS=true
	fi
fi

if [ "$HAS_NPM" == true ]; then
	if [ "$INSTALLED_DIFFSOFANCY" != true ]; then
		echo "Installing diff-so-fancy..."
		npm install -g diff-so-fancy && INSTALLED_DIFFSOFANCY=true
	fi
fi

source ~/.bash-detect-system.sh

if is_cygwin; then
	cp -i .ssh-agent-start-cygwin.sh ~/
fi
