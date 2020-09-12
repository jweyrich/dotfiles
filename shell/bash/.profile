source ~/.shell-profile.sh

# Execute .bashrc if it exists
if [ "$BASH" ]; then
	if [ -f $HOME/.bashrc ]; then
		. $HOME/.bashrc
	fi
fi
