#!/bin/sh

if $(command -v brew > /dev/null); then HAS_HOMEBREW=true; fi
if $(command -v clangd > /dev/null); then HAS_LLVM_CLANGD=true; fi
if $(command -v compiledb > /dev/null); then HAS_COMPILEDB=true; fi
if $(command -v go > /dev/null); then HAS_GO=true; fi
if $(command -v npm > /dev/null); then HAS_NPM=true; fi
if $(command -v nvim > /dev/null); then HAS_NVIM=true; fi
if $(command -v pip3 > /dev/null); then HAS_PIP=true; fi

#####
##### ./vim
#####

PREFIX=./vim
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp -i $PREFIX/.vimrc ~/
vim +PluginInstall +qall

# powerline-status for Vim
if [ "$HAS_PIP" = true ]; then
	if [ "$INSTALLED_POWERLINE_STATUS" != true ]; then
		echo "Installing powerline-status..."
		pip3 install --user powerline-status && INSTALLED_POWERLINE_STATUS=true
	fi
fi

#####
##### ./tools
#####

PREFIX=./tools
cp -ir $PREFIX/bin ~/


if [ "$HAS_HOMEBREW" = true ]; then
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

if [ "$HAS_NPM" = true ]; then
	if [ "$INSTALLED_DIFFSOFANCY" != true ]; then
		echo "Installing diff-so-fancy..."
		npm install -g diff-so-fancy && INSTALLED_DIFFSOFANCY=true
	fi
fi

#####
##### ./gdb
#####

PREFIX=./gdb
cp -i $PREFIX/.gdbinit ~/

#####
##### ./nvim
#####

PREFIX=./nvim

if [ "$HAS_HOMEBREW" = true ]; then
	echo "Updating homebrew..."
	brew update

	# Install neovim
	if [ "$HAS_NVIM" != true ]; then
		brew install neovim
	fi

	# Install llvm/clangd
	if [ "$HAS_LLVM_CLANGD" != true ]; then
		brew install llvm
		# Add /opt/homebrew/usr/local/opt/llvm/bin/ to PATH:
		# test -d "/opt/homebrew/opt/llvm/bin" && append_to_path "/opt/homebrew/opt/llvm/bin"
	fi
fi

if [ "$HAS_PIP" = true ]; then
	# Install compiledb
	# It's used to generate a `compile_commands.json` required by clangd for each project.
	# To generate it for Make-based projects:
	#  cd /project/directory && make -Bnwk clean all | compiledb -o- > compile_commands.json
	if [ "$HAS_COMPILEDB" != true ]; then
		pip3 install --user compiledb
		# Add compiledb to PATH
		# test -d "$HOME/Library/Python/3.9/bin" && append_to_path "$HOME/Library/Python/3.9/bin"
	fi
fi

curl -fLo ~/.config/nvim/autoload/plug.vim \
	--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp -i $PREFIX/*.vim ~/.config/nvim/

nvim +PluginInstall +qall
nvim -c 'CocInstall -sync coc-cmake coc-clangd coc-python coc-yaml coc-json coc-html coc-css coc-tsserver coc-highlight|q'

# Ask the user to install the font that has all required glyphs.
curl -fLo "~/Desktop/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete.ttf" \
	"https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Meslo/M/Regular/complete/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete.ttf"
open "~/Desktop/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete.ttf"

#####
##### ./shell/zsh
#####

PREFIX=./shell/zsh
cp -i $PREFIX/.zshrc ~/
cp -i $PREFIX/.zprofile ~/
cp -i $PREFIX/../.shell-profile.sh ~/
cp -i $PREFIX/../.shell-rc.sh ~/

if [ "$HAS_HOMEBREW" = true ]; then
	echo "Updating homebrew..."
	brew update

	if [ "$INSTALLED_ITERM2" != true ]; then
		echo "Installing iterm2..."
		brew cask install iterm2 && INSTALLED_ITERM2=true
	fi
fi

if [ "$HAS_CURL" = true ]; then
	if [ "$INSTALLED_OHMYZSH" != true ]; then
		echo "Installing oh-my-zsh..."
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && INSTALLED_OHMYZSH=true
	fi
fi

if [ "$HAS_GIT" = true ]; then
	if [ "$INSTALLED_POWERLEVEL10K" != true ]; then
		echo "Installing powerlevel10k..."
		git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k && INSTALLED_POWERLEVEL10K=true
	fi
fi

cp -i $PREFIX/../.shell-detect-system.sh ~/
source ~/.shell-detect-system.sh

if is_cygwin; then
	cp -i $PREFIX/../shell/.ssh-agent-start-cygwin.sh ~/
fi

#####
##### ./lldb
#####

PREFIX=./lldb
cp -i $PREFIX/.lldbinit ~/./vim/install.sh

#####
##### ./git
#####

PREFIX=./git
cp -i $PREFIX/.gitconfig ~/
cp -i $PREFIX/.gitignore ~/