#!/bin/bash
cp -i .bash-detect-system.sh ~/
cp -i .bash_colors ~/
cp -i .bashrc ~/
cp -i .git-completion.bash ~/
cp -i .git-prompt.sh ~/
cp -i .inputrc ~/
cp -i .profile ~/
cp -ir bin ~/

source ~/.bash-detect-system.sh

if is_cygwin; then
	cp -i .ssh-agent-start-cygwin.sh ~/
fi
