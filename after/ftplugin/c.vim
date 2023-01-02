"---> select the first item from lsp/cmp
im df <C-j><CR>
im fd <C-j><CR>

"""" select the first item from lsp/cmp
im dk <C-k><CR>
im kd <C-k><CR>
" noremap <leader>mn :w <cr> :!clang % && ./a.out <cr>

inoremap <A-space> <C-o>:TermExec cmd='clang % && ./a.out'<cr>
nmap <A-space> :TermExec cmd='clang % && ./a.out'<cr>

"--> auto write on change
autocmd TextChanged,TextChangedI <buffer> silent write
