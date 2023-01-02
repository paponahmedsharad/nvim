" set tabstop=2
" set shiftwidth=2
" set softtabstop=2

"""" select the first item from lsp/cmp
" im df <C-j><CR>
" im fd <C-j><CR>

"""" select the first item from lsp/cmp
" im dk <C-k><CR>
" im kd <C-k><CR>

"""" go to begging of the line
" im <C-a> <C-o>^
"""" go to end of the line
" im <C-e> <C-o>A


""""chnage indside of a tag
" im <C-c> <Esc>cit
" nmap <C-c> <Esc>cit

"""" ?
" nmap <C-Enter> <C-z>,
" im <M-c> <Esc>jcit
" nmap <M-c> <Esc>jcit

autocmd TextChanged,TextChangedI <buffer> silent write

"""" Run the code in a terminal
"""""""""""" node.js """"""""
" inoremap <A-space> <C-o>:TermExec cmd='node %'<cr>
" nmap <A-space> :TermExec cmd='node %'<cr>
"""""""""""" deno """"""""
inoremap <A-space> <C-o>:TermExec cmd='deno run %'<cr>
nmap <A-space> :TermExec cmd='deno run %'<cr>

" js formatter; npm -g install js-beautify
nmap <A-p> :%!js-beautify<cr><cr>
im <A-p> <C-o>:%!js-beautify<cr><cr>
