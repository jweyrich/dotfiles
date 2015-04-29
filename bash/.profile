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

# Global
umask 022

# Subversion
export SVN_EDITOR=/usr/bin/vim
prepend_to_path "/opt/subversion/bin"

# Homebrew
prepend_to_path "/usr/local/bin"
prepend_to_path "/usr/local/sbin"

# Python
append_to_path "/Library/Frameworks/Python.framework/Versions/2.6/bin"

# MySQL
append_to_path "/usr/local/mysql/bin"

# Personal utilities
append_to_path "$HOME/bin"

# SCons
append_to_path "~/bin/scons/bin"

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Docker
export DOCKER_HOST=tcp://127.0.0.1:4243

export PATH
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Execute .bashrc if it exists
if [ "$BASH" ]; then
	if [ -f ~/.bashrc ]; then
		. ~/.bashrc
	fi
fi

