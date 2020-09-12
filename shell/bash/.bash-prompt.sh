# Colors
source ~/.bash_colors

# Prompt
function _update_ps1() {
	# Show the current branch in prompt
	if ! is_cygwin ; then
		if [ -f "$GOPATH/bin/powerline-go" ]; then
			# Use powerline-go to configure an awesome prompt - depends on powerline-go
			PS1="$($GOPATH/bin/powerline-go -error $? -modules nix-shell,venv,user,host,ssh,cwd,docker,kube,perms,git,hg,jobs,exit,root,vgo)"
		else
			# Show the current branch in prompt - depends on git-prompt.sh
			PS1='\[${magenta}\]\u@\h$\[${reset}\]:\W$(__git_ps1 " [* \[${green}\]%s\[${reset}\]]")\$ '
		fi
	else
		# Show the current branch in prompt - depends on git-prompt.sh
		PS1='\u@\h$:\W$(__git_ps1 " [* %s]")\$ '
	fi
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi