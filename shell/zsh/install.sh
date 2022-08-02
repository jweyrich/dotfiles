#!/bin/bash

cp -i .zshrc ~/
cp -i .zprofile ~/
cp -i ../.shell-profile.sh ~/
cp -i ../.shell-rc.sh ~/

$(which brew 2>&1 > /dev/null) && if [[ $? = 0 && ! -z $(brew --prefix) ]]; then HAS_HOMEBREW=true; fi
if [ ! -z $(which go) ]; then HAS_GO=true; fi
if [ ! -z $(which pip3) ]; then HAS_PIP=true; fi
if [ ! -z $(which npm) ]; then HAS_NPM=true; fi

if [ "$HAS_HOMEBREW" == true ]; then
	echo "Updating homebrew..."
	brew update

	if [ "$INSTALLED_ITERM2" != true ]; then
		echo "Installing iterm2..."
		brew cask install iterm2 && INSTALLED_ITERM2=true
	fi
fi

if [ "$HAS_CURL" == true ]; then
	if [ "$INSTALLED_OHMYZSH" != true ]; then
		echo "Installing oh-my-zsh..."
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && INSTALLED_OHMYZSH=true
	fi
fi

if [ "$HAS_GIT" == true ]; then
	if [ "$INSTALLED_POWERLEVEL10K" != true ]; then
		echo "Installing powerlevel10k..."
		git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k && INSTALLED_POWERLEVEL10K=true
	fi
fi

cp -i ../.shell-detect-system.sh ~/
source ~/.shell-detect-system.sh

if is_cygwin; then
	cp -i ../shell/.ssh-agent-start-cygwin.sh ~/
fi
