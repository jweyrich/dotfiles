" Highlight trailing whitespace only after some text, ignoring empty lines.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\(\S\+\)\@<=\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\(\S\+\)\@<=\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\(\S\+\)\@<=\s\+$/
autocmd InsertLeave * match ExtraWhitespace /\(\S\+\)\@<=\s\+$/
autocmd BufWinLeave * call clearmatches()

