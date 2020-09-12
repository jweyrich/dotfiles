source ~/.shell-profile.sh

# Execute .zshrc if it exists
if [ "$ZSH" ]; then
	if [ -f $HOME/.zshrc ]; then
		. $HOME/.zshrc
	fi
fi
