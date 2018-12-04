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
set ruler

" Don't wrap lines
set nowrap

" Disable file type for Vundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

"
" Utility plugins
"

" Window to navigate the filesystem tree. Toggle using ctrl+c+n
Plugin 'scrooloose/nerdtree'

" Highlight trailing spaces
Plugin 'ntpeters/vim-better-whitespace'

" Swap windows without modifying their layout
Plugin 'wesQ3/vim-windowswap'

" Align text for you. Use :Tab /= to align C variable initializations for example.
Plugin 'godlygeek/tabular'

" Search TODO, FIXME and XXX.
" Run :SearchTasks .
"  or SearchTasks app/*.py
"  or SearchTasksGrep **/*.c
Plugin 'gilsondev/searchtasks.vim'

"
" Programming support
"

Plugin 'universal-ctags/ctags'
Plugin 'Townk/vim-autoclose'
Plugin 'maksimr/vim-jsbeautify'

" Autocomplete snippets. Open editor with :UltiSnipsEdit
" Write an snippet and use it. Example:
" snippet t "simple html tag"
" <$1>hello</$1>
" endsnippet
" In your window, type t<tab>
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

"
" Markdown / Writting
"

Plugin 'reedes/vim-pencil'

" Grammar checker
Plugin 'LanguageTool'

"
" Theme / UI
"

" Add glyphs/icons to NERDTree and other plugins
Plugin 'ryanoasis/vim-devicons'

" Status/tabline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" Plugins configuration
"

" NERDtree configuration
let NERDTreeIgnore = ['\.o$','\.pyc$','\.pyo$']
map <C-n> :NERDTreeToggle<CR>

" Vim-UtilSnips configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Vim-Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

" Vim-pencil settings
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

"
" General configuration
"

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

" <TAB>: completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

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

" Auto-reload ~/.vimrc after saving it.
autocmd! bufwritepost .vimrc source ~/.vimrc
