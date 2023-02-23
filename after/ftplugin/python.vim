"""" select the first item from lsp/cmp
" im df <C-j><CR>
" im fd <C-j><CR>

"""" select the first item from lsp/cmp
" im dk <C-k><CR>
" im kd <C-k><CR>

"""" go to begging of the line
" im <C-a> <C-o>^
"""" go to end of the line
" im <C-e> <C-o>$

"""" helpful for list
" im fr <Right>,<space>
" im rf <Right>,<space>

" im gh <C-o>$,<Enter>
" im hg <C-o>$,<Enter>

" im ij <C-o>$:<Enter>
" im ji <C-o>$:<Enter>

" For local replace
" nnoremap gl gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
" nnoremap gR gD:%s/<C-R>///gc<left><left><left>

"""" Run the code in a terminal
inoremap <A-space> <C-o>:TermExec cmd='python %'<cr>
nmap <A-space> :TermExec cmd='python %'<cr>

"""" Autocommand to save the text when change happen
autocmd TextChanged,TextChangedI <buffer> silent write
