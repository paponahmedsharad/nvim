set tabstop=2
set shiftwidth=2
set softtabstop=2

"""" select the first item from lsp/cmp
" im df <C-j><CR>
" im fd <C-j><CR>

"""" select the first item from lsp/cmp
" im dk <C-k><CR>
" im kd <C-k><CR>

"""" go to begging of the line
im <C-a> <C-o>^
"""" go to end of the line
im <C-e> <C-o>$


""""chnage indside of a tag
im <C-c> <Esc>cit
nmap <C-c> <Esc>cit

"""" ?
" nmap <C-Enter> <C-z>,
" im <M-c> <Esc>jcit
" nmap <M-c> <Esc>jcit

" AUTO SAVE
autocmd TextChanged,TextChangedI <buffer> silent write
