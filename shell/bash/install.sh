#!/bin/bash

cp -i .bash_colors ~/
cp -i .bashrc ~/
cp -i .inputrc ~/
cp -i .profile ~/
cp -i .bash-complete.sh ~/
cp -i .bash-prompt.sh ~/
cp -i ../.shell-profile.sh ~/
cp -i ../.shell-rc.sh ~/

$(which brew 2>&1 > /dev/null) && if [[ $? = 0 && ! -z $(brew --prefix) ]]; then HAS_HOMEBREW=true; fi
if [ ! -z $(which go) ]; then HAS_GO=true; fi

if [ "$HAS_HOMEBREW" == true ]; then
	echo "Updating homebrew..."
	brew update

	if [ "$INSTALLED_BASH_COMPLETION" != true ]; then
		echo "Installing bash-completion..."
		brew install bash-completion && INSTALLED_BASH_COMPLETION=true
	fi
fi

# powerline-go for the shell
if [ "$HAS_GO" == true ]; then
	if [ "$INSTALLED_POWERLINE_GO" != true ]; then
		echo "Installing powerline-go..."
		go get -u github.com/justjanne/powerline-go && INSTALLED_POWERLINE_GO=true
	fi
fi

cp -i ../.shell-detect-system.sh ~/
source ~/.shell-detect-system.sh

if is_cygwin; then
	cp -i ../.ssh-agent-start-cygwin.sh ~/
fi
