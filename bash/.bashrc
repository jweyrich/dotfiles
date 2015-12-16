source ~/.bash-detect-system.sh

# Options
shopt -s checkhash
shopt -s extglob
shopt -u mailwarn
shopt -s no_empty_cmd_completion

# Git completion & prompt
source ~/.git-completion.sh
source ~/.git-prompt.sh

# Colors
source ~/.bash_colors

# Show the current branch in prompt
if ! is_cygwin ; then
	export PS1='\[${magenta}\]\u@\h$\[${reset}\]:\W$(__git_ps1 " [* \[${green}\]%s\[${reset}\]]")\$ '
else
	export PS1='\u@\h$:\W$(__git_ps1 " [* %s]")\$ '
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

# For now, I want only Cygwin to automatically start the ssh-agent .
if is_cygwin ; then
	source ~/.ssh-agent-start-cygwin.sh
fi
