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
export PS1='\[${magenta}\]\u@\h$\[${reset}\]:\W$(__git_ps1 " [* \[${green}\]%s\[${reset}\]]")\$ '

# Aliases
alias ls="/bin/ls -CFG"
alias grep="/usr/bin/grep --color"
alias flushdns="dscacheutil -flushcache"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
