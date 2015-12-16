#!/bin/bash
cp -i .bash-detect-system.sh ~/
cp -i .bashrc ~/
cp -i .bash_colors ~/
cp -i .profile ~/
cp -i .git-completion.sh ~/
cp -i .git-prompt.sh ~/
cp -ir bin ~/

source ~/.bash-detect-system.sh

if is_cygwin; then
	cp -i .ssh-agent-start-cygwin.sh ~/
fi
