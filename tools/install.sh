#!/bin/bash

cp -ir bin ~/

if [ ! -z $(brew --prefix) ]; then HAS_HOMEBREW=true; fi
#if [ ! -z $(which go) ]; then HAS_GO=true; fi
#if [ ! -z $(which pip3) ]; then HAS_PIP=true; fi
if [ ! -z $(which npm) ]; then HAS_NPM=true; fi

if [ "$HAS_HOMEBREW" == true ]; then
	echo "Updating homebrew..."
	brew update

	if [ "$INSTALLED_GIT" != true ]; then
		echo "Installing git..."
		brew install git && INSTALLED_GIT=true
	fi
	if [ "$INSTALLED_COLORDIFF" != true ]; then
		echo "Installing colordiff..."
		brew install colordiff && INSTALLED_COLORDIFF=true
	fi
	if [ "$INSTALLED_DIFFSOFANCY" != true ]; then
		echo "Installing diff-so-fancy..."
		brew install diff-so-fancy && INSTALLED_DIFFSOFANCY=true
	fi
fi

if [ "$HAS_NPM" == true ]; then
	if [ "$INSTALLED_DIFFSOFANCY" != true ]; then
		echo "Installing diff-so-fancy..."
		npm install -g diff-so-fancy && INSTALLED_DIFFSOFANCY=true
	fi
fi
