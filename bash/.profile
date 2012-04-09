# Subversion
export SVN_EDITOR=/usr/bin/vim

# Global
umask 077 # Most secure umask
export ANT_HOME="/usr/local/ant"
PATH="/opt/local/bin:/opt/local/sbin:${PATH}" # MacPorts
PATH="/opt/subversion/bin:${PATH}" # SVN
PATH="${PATH}:/Library/Frameworks/Python.framework/Versions/2.6/bin"
PATH="${PATH}:/usr/local/mysql/bin" # MySQL
PATH="${PATH}:~/bin" # Personal utilities
PATH="${PATH}:~/bin/scons/bin" # SCons
PATH="${PATH}:${ANT_HOME}/bin" # Apache Ant
export PATH
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
alias ls="/bin/ls -CFG"
alias grep="/usr/bin/grep --color"

