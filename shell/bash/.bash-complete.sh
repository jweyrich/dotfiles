# Multiple completions using bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

# AWS CLI completion (only for Bash)
if [ ! -z $(which aws_completer) ]; then HAS_AWS_COMPLETER=true; fi
if [ "$HAS_AWS_COMPLETER" == true ]; then
	complete -C aws_completer aws
fi
