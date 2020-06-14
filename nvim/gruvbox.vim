Plug 'morhetz/gruvbox', { 'tag': 'v3.0.1-rc.0' }
"Plug 'gruvbox-community/gruvbox'

"set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_termcolors = 256

" Change colorscheme only after doing all the startup stuff - that's what
" VimEnter does.
autocmd VimEnter * colorscheme gruvbox
