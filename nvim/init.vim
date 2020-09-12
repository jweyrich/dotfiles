"
" AUTHOR: Jardel Weyrich <jweyrich@gmail.com>
" URL: https://github.com/jweyrich/dotfiles/
"

set encoding=utf-8

" Enable mouse scrolling
set mouse=a

" Show the filename in the window titlebar.
set title

" Show line numbers.
set number
set ruler

" Don't wrap lines
set nowrap

" Set tab to N space.
set tabstop=4
set softtabstop=0
set noexpandtab
set copyindent
set preserveindent
set shiftwidth=4

" Set auto-indenting on for programming.
set autoindent

" Syntax highlight.
syntax on

" Make backspace key work the way it should.
set backspace=indent,eol,start

" Automatically show matching brackets. works like it does in bbedit.
set showmatch

" Hide the mouse pointer while typing.
set mousehide

" Search wraps around end of file.
set wrapscan

" Highlighting all the search pattern matches. Use nohlsearch to turn off.
set hlsearch

" To make <F2> work as expected, your terminal MUST BE xterm, not ansi.
" Show a visual feedback in the status line
nnoremap <F2> :set invpaste paste?<CR>
" Turn off auto-indent when pasting text.
set pastetoggle=<F2>
set showmode

" Use vim-plug to manage plugins
call plug#begin('~/.config/nvim/plugged')

" Keep Plug commands between plug#begin/end.

function! SourceConfig(relativePath)
  	let configdir = expand('$HOME/.config/nvim')
  	let fullPath = configdir . '/'. a:relativePath
  	exec 'source ' . fullPath
endfunction

" Navigation explorer using NERDTree
call SourceConfig('nerdtree.vim')

" Auto-completion using language backends: clangd, tsserver, etc.
call SourceConfig('coc.vim')

" Auto-completion using the deoplete.nvim plugin
"call SourceConfig('deoplete.vim')

" Auto-formatting using the neoformat plugin (which uses clang-format)
call SourceConfig('neoformat.vim')

" Comment/Uncomment blocks of code
call SourceConfig('nerdcommenter.vim')

" Switch between header and implementation files.
call SourceConfig('switch-hdrimpl.vim')

" Theme
call SourceConfig('gruvbox.vim')
call SourceConfig('airline.vim')

" Keep Plug commands between plug#begin/end.
call plug#end()

" Allow arrow keys to navigate between auto-completion options in the command-line window
cmap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
cmap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"

" Auto-reload ~/.config/nvim/init.vim after saving it.
autocmd! BufWritePost init.vim source %
