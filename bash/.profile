# Prepend directory to path, if it exists
function prepend_to_path() {
	if [[ -d "${1}" ]]; then
		PATH=${1}:${PATH}
	fi
}

# Append directory to path, if it exists
function append_to_path() {
	if [[ -d "${1}" ]]; then
		PATH=${PATH}:${1}
	fi
}

# Source script, if it exists
function source_script() {
	if [[ -f "${1}" ]]; then
		source ${1}
	fi
}

# Convert manpage to PDF and open it in Prewiew
function pman {
	man -t "${1}" | open -f -a /Applications/Preview.app
}

# Print the current Python site-packages directory
function sitepackages() {
	python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"
}

vscode () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" --args "$F"
    fi
}

# Global
umask 022

# Subversion
export SVN_EDITOR=/usr/bin/vim

# Homebrew
test -d "/usr/local/bin" && prepend_to_path "/usr/local/bin"
test -d "/usr/local/sbin" && prepend_to_path "/usr/local/sbin"

# MySQL
test -d "/usr/local/mysql/bin" && append_to_path "/usr/local/mysql/bin"

# Personal utilities
test -d "$HOME/bin" && append_to_path "$HOME/bin"

# SCons
test -d "$HOME/bin/scons/bin/" && append_to_path "$HOME/bin/scons/bin/"

# AWS CLI
test -d "$HOME/bin/AWS-ElasticBeanstalk-CLI/eb/macosx/python2.7/" && append_to_path "$HOME/bin/AWS-ElasticBeanstalk-CLI/eb/macosx/python2.7/"

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Go
test -d "$HOME/go" && export GOPATH="$HOME/go" && append_to_path "$GOPATH"

# Docker
export DOCKER_HOST=tcp://127.0.0.1:4243

export PATH
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Execute .bashrc if it exists
if [ "$BASH" ]; then
	if [ -f $HOME/.bashrc ]; then
		. $HOME/.bashrc
	fi
fi

