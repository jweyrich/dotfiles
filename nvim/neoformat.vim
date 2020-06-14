"
" Settings for auto-formatting using the neoformat plugin (which uses clang-format)
"
" Requirements:
"   brew install clang-format
"

Plug 'sbdchd/neoformat'

let g:neoformat_cpp_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['--style="{IndentWidth: 4}"']
            \}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

" Enable alignment
let g:neoformat_basic_format_align = 1

" Runs all formatters for current buffer
let b:neoformat_run_all_formatters = 1

" Disable tab to spaces conversion
let g:neoformat_basic_format_retab = 0

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" Only msg when there is an error
let g:neoformat_only_msg_on_error = 1

"nnoremap <leader>f :Neoformat<CR>
map <C-K> :Neoformat %<CR>
imap <C-K> :Neoformat %<CR>


" Run formatter on save. Can undo pressing u
" augroup fmt
"     autocmd!
"     autocmd BufWritePre * undojoin | Neoformat
" augroup END
"
