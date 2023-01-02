set tabstop=2
set shiftwidth=2
set softtabstop=2

"""" select the first item from lsp/cmp
" im df <C-j><CR>
" im fd <C-j><CR>
" imap df <C-j><CR> <Esc>
" imap fd <C-j><CR> <Esc>

" im df <C-j><CR>
" im fd <C-j><CR>

"""" select the first item from lsp/cmp
im dk <C-k><CR>
im kd <C-k><CR>

"""" go to begging of the line
im <C-a> <C-o>^
"""" go to end of the line
im <C-e> <C-o>$


""""chnage indside of a tag
im <C-c> <Esc>cit
nmap <C-c> <Esc>cit

"---> put ; end of the line
im ji <C-o>$;<Enter>
im ij <C-o>$;<Enter>

"---> make a lsp snippets
" im fr : ;<Left>
" im rf : ;<Left>

" nmap jp <Esc>yisvis<Space>/}p
" nmap pj <Esc>yisvis<Space>/}p


" AUTO SAVE
" autocmd TextChanged,TextChangedI <buffer> silent write
