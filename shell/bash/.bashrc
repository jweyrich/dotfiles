source ~/.shell-detect-system.sh
source ~/.shell-rc.sh

# Options
shopt -s histappend # Append to the history instead of overwriting it.
shopt -s checkhash
shopt -s extglob
shopt -u mailwarn
shopt -s no_empty_cmd_completion

# Don't log duplicate commands to the history.
export HISTCONTROL=ignoredups:erasedups

source ~/.bash-complete.sh
source ~/.bash-prompt.sh
