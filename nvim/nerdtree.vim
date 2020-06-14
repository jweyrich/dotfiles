" Window to navigate the filesystem tree. Toggle using ctrl+c+n
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Add glyphs/icons to NERDTree and other plugins
Plug 'ryanoasis/vim-devicons'

" Adjust font - https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Meslo/M/Regular/complete/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete.ttf
"set guifont=Meslo\ LG\ M\ Regular\ Nerd\ Font\ Complete:h11

let g:NERDTreeMinimalUI = 1  " Hide help text

" NERDtree configuration
let NERDTreeIgnore = ['\.o$','\.pyc$','\.pyo$']
map <C-n> :NERDTreeToggle<CR>
