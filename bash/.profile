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

# Global
umask 022

# Subversion
export SVN_EDITOR=/usr/bin/vim
prepend_to_path "/opt/subversion/bin"

# MacPorts
prepend_to_path "/opt/local/sbin"
prepend_to_path "/opt/local/bin"

# Python
append_to_path "/Library/Frameworks/Python.framework/Versions/2.6/bin"

# MySQL
append_to_path "/usr/local/mysql/bin"

# Personal utilities
append_to_path "$HOME/bin"

# SCons
append_to_path "~/bin/scons/bin"

# Apache Ant
export ANT_HOME="/usr/local/ant"
append_to_path "${ANT_HOME}/bin"

export PATH
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Execute .bashrc if it exists
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

