source ~/.bash-detect-system.sh

# Options
shopt -s histappend # Append to the history instead of overwriting it.
shopt -s checkhash
shopt -s extglob
shopt -u mailwarn
shopt -s no_empty_cmd_completion

# Don't log duplicate commands to the history.
export HISTCONTROL=ignoredups:erasedups

# Git completion & prompt
source ~/.git-completion.bash
source ~/.git-prompt.sh

# Colors
source ~/.bash_colors

# Prompt
function _update_ps1() {
	# Show the current branch in prompt
	if ! is_cygwin ; then
		if [ -f ~/powerline-shell.py ]; then
			# Use powerline-shell to configure an awesome prompt - depends on powerline-shell
			PS1="$(~/powerline-shell.py $? 2> /dev/null)"
		else
			# Show the current branch in prompt - depends on git-prompt.sh
			PS1='\[${magenta}\]\u@\h$\[${reset}\]:\W$(__git_ps1 " [* \[${green}\]%s\[${reset}\]]")\$ '
		fi
	else
		# Show the current branch in prompt - depends on git-prompt.sh
		PS1='\u@\h$:\W$(__git_ps1 " [* %s]")\$ '
	fi
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Aliases
alias ls="/bin/ls -CFG"

# Cygwin doesn't support grep --color switch.
if ! is_cygwin ; then
	alias grep="/usr/bin/grep --color"
fi

# dscacheutil exists only on Mac.
if is_macosx ; then
	alias flushdns="dscacheutil -flushcache"
fi

# Cygwin doesn't have dig installed by default.
if ! is_cygwin ; then
	alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
fi

# Bash completion (only for Bash)
complete -C aws_completer aws

# For now, I want only Cygwin to automatically start the ssh-agent .
if is_cygwin ; then
	source ~/.ssh-agent-start-cygwin.sh
fi
