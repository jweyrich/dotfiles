" Show line numbers
set number

" Show filename at the bottom
set laststatus=2 " Always show the status line in inactive windows
set modeline
set statusline=%F%m%r%h%w\ L:%l\ C:%c%V\ %=\ ASCII:%b\ OFF:%o\ [%p%%]\ TYPE:%{&ff}

" Set tab to N space
set tabstop=4
set softtabstop=4

" Syntax highlight
syntax on

" Set auto-indenting on for programming
set autoindent

" Turn off compatibility with the old vi
set nocompatible

" Make that backspace key work the way it should
set backspace=indent,eol,start

" Automatically show matching brackets. works like it does in bbedit.
set showmatch

" Hide the mouse pointer while typing
set mousehide

" Highlighting all the search pattern matches. Use nohlsearch to turn off
set hlsearch

" Turn off auto-indent when pasting text
set pastetoggle=<F3>

" Turning completion on. Use CTRL-X O
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" ...
set tw=0 wrap linebreak

