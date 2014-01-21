"
" AUTHOR: Jardel Weyrich <jweyrich@gmail.com>
" URL: https://github.com/jweyrich/dotfiles/
"

" Set UTF-8 encoding without BOM.
set encoding=utf-8 nobomb

" Show the filename in the window titlebar.
set title

" Show line numbers.
set number

" Show filename at the bottom.
set laststatus=2 " Always show the status line in inactive windows.
set modeline
set statusline=%F%m%r%h%w\ L:%l\ C:%c%V\ %=\ ASCII:%b\ OFF:%o\ [%p%%]\ TYPE:%{&ff}

" Set tab to N space.
set tabstop=4
set softtabstop=4

" Syntax highlight.
syntax on

" Set auto-indenting on for programming.
set autoindent

" Turn off compatibility with the old vi.
set nocompatible

" Make that backspace key work the way it should.
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

" Character for CLI expansion (TAB-completion).
set wildchar=<TAB>
" Hitting TAB in command mode will show possible completions above command line.
set wildmenu
" Complete only until point of ambiguity.
set wildmode=list:longest

" Turning completion on. Use CTRL-X O.
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" ...
set tw=0 wrap linebreak

" Map HOME and END
map <ESC>[H <Home>
map <ESC>[F <End>
imap <ESC>[H <C-O><Home>
imap <ESC>[F <C-O><End>
cmap <ESC>[H <Home>
cmap <ESC>[F <End>

" Map PGUP (Fn + Shift + Up) and PGDOWN (Fn + Shift + Down)
map <ESC>[5~ <C-U>
map <ESC>[6~ <C-D>
imap <ESC>[5~ <C-O><C-U>
imap <ESC>[6~ <C-O><C-D>
set nostartofline " Preseve column when moving through lines.

" Map Ctrl+d to Forward Delete (insert mode only)
inoremap <C-d> <Del>

" Map Fn+Delete to Forward Delete (normal and insert modes)
nmap <ESC>[3~ x
imap <ESC>[3~ <Del>

source ~/.vim_plugins/highlight_trailing_whitespace.vim

" Auto-reload ~/.vimrc after saving it.
autocmd! bufwritepost .vimrc source ~/.vimrc
