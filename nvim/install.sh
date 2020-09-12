#!/bin/bash

if [ ! -z $(brew --prefix) ]; then HAS_HOMEBREW=true; fi
if [ ! -z $(which nvim) ]; then HAS_NVIM=true; fi
if [ ! -z $(which pip3) ]; then HAS_PIP=true; fi
if [ ! -z $(which clangd) ]; then HAS_LLVM_CLANGD=true; fi
if [ ! -z $(which compiledb) ]; then HAS_COMPILEDB=true; fi

if [ "$HAS_HOMEBREW" == true ]; then
	echo "Updating homebrew..."
	brew update

	# Install neovim
	if [ "$HAS_NVIM" != true ]; then
		brew install neovim
	fi

	# Install llvm/clangd
	if [ "$HAS_LLVM_CLANGD" != true ]; then
		brew install llvm
		# Add /usr/local/opt/llvm/bin/ to PATH:
		# test -d "/usr/local/opt/llvm/bin" && append_to_path "/usr/local/opt/llvm/bin"
	fi
fi

if [ "$HAS_PIP" == true ]; then
	# Install compiledb
	# It's used to generate a `compile_commands.json` required by clangd for each project.
	# To generate it for Make-based projects:
	#  cd /project/directory && make -Bnwk clean all | compiledb -o- > compile_commands.json 
	if [ "$HAS_COMPILEDB" != true ]; then
		pip3 install --user compiledb
		# Add compiledb to PATH
		# test -d "$HOME/Library/Python/3.7/bin" && append_to_path "$HOME/Library/Python/3.7/bin"
	fi
fi

curl -fLo ~/.config/nvim/autoload/plug.vim \
	--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp -i *.vim ~/.config/nvim/

nvim +PluginInstall +qall
nvim -c 'CocInstall -sync coc-cmake coc-clangd coc-python coc-yaml coc-json coc-html coc-css coc-tsserver coc-highlight|q'

# Ask the user to install the font that has all required glyphs.
curl -fLo "~/Desktop/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete.ttf" \
	"https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Meslo/M/Regular/complete/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete.ttf"
open "~/Desktop/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete.ttf"
