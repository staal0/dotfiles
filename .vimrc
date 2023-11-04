syntax on
let g:dracula_colorterm = 0
colorscheme dracula

:set number

:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
:set list

noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

