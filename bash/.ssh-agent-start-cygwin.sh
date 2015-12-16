#!bash.exe
export SSH_AUTH_SOCK=/tmp/.ssh-socket
echo ;
echo Starting connection with ssh-agent...
ssh-add -l 2>&1 >/dev/null
if [ $? = 2 ]; then
	rm -f /tmp/.ssh-script /tmp/.ssh-agent-pid /tmp/.ssh-socket
	# Exit status 2 means couldn't connect to ssh-agent; start one now
	echo Creating new ssh-agent...
	ssh-agent -a $SSH_AUTH_SOCK > /tmp/.ssh-script
	. /tmp/.ssh-script
	echo $SSH_AGENT_PID > /tmp/.ssh-agent-pid
	ssh-add;
	echo ssh-agent set up successfully.
	ssh-add -l
fi
