" Themes

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Use the powerline fonts
let g:airline_powerline_fonts = 1

" Select our theme - Since we're using a gruvbox theme, we don't set it here.
"let g:airline_theme='molokai'
"let g:airline_theme='solarized_flood'
let g:airline_theme='gruvbox'

let g:airline#extensions#tabline#enabled = 1 				" enable airline tabline
let g:airline#extensions#tabline#show_close_button = 0 		" remove 'X' at the end of the tabline
let g:airline#extensions#tabline#buffer_nr_show = 1 		" show buffer number
let g:airline#extensions#tabline#fnamemod = ':t' 			" disable file paths in the tab
let g:airline#extensions#tabline#show_tabs = 0 				" don't show tabs
let g:airline#extensions#tabline#show_buffers = 1 			" show all buffers
let g:airline#extensions#tabline#tab_nr_type = 1			" show tab number
let g:airline#extensions#tabline#show_splits = 0 			" disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tmuxline#enabled = 0 				" disable tmuxline
let g:airline#extensions#wordcount#enabled = 0 				" disable word counter
let g:airline#extensions#tagbar#enabled = 1 				" disable tagbar
let g:airline_skip_empty_sections = 1 						" remove separators for empty sections
let g:airline_detect_iminsert=1 							" enable iminsert detection

" Buffer navigation
" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
