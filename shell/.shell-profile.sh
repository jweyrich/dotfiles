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
function pman() {
	man -t "${1}" | open -f -a /Applications/Preview.app
}

# Print the current Python 3 site-packages directory
function sitepackages() {
	python3 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"
}

# Shamelessly borrowed from https://github.com/paulirish/dotfiles/blob/606d85f083/.functions#L27 - Thanks!
# cd into whatever is the forefront Finder window.
function cdf() {  # short for cdfinder
	cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# Global
umask 022

# Personal utilities
test -d "$HOME/bin" && append_to_path "$HOME/bin"

# Homebrew
test -f "/opt/homebrew/bin/brew" && eval "$(/opt/homebrew/bin/brew shellenv)"

# LLVM/clangd
test -d "/opt/homebrew/opt/llvm/bin" && append_to_path "/opt/homebrew/opt/llvm/bin"

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# NVM - Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && source "$(brew --prefix nvm)/nvm.sh"  # This loads nvm
[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && source "$(brew --prefix nvm)/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Subversion
export SVN_EDITOR=vim

# Go
test -d "$HOME/go" && export GOPATH="$HOME/go" && append_to_path "$GOPATH"

export PATH
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
