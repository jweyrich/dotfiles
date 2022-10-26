source ~/.shell-detect-system.sh

# Aliases
alias ls="/bin/ls -CFG"
alias vim="/opt/homebrew/bin/nvim"

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
	alias myip="dig ANY +short myip.opendns.com @resolver1.opendns.com"
	alias myip4="dig -4 ANY +short myip.opendns.com @resolver1.opendns.com"
fi

# For now, I want only Cygwin to automatically start the ssh-agent .
if is_cygwin ; then
	source ~/.ssh-agent-start-cygwin.sh
fi

export AWS_VAULT_BACKEND="keychain"
