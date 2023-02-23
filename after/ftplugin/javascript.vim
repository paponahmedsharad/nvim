set tabstop=4
set shiftwidth=4
set softtabstop=4

" autocmd TextChanged,TextChangedI <buffer> silent write

"""" Run the code in a terminal
" NODEJS
" inoremap <A-space> <C-o>:TermExec cmd='node %'<cr>
" nmap <A-space> :TermExec cmd='node %'<cr>
" DENO
inoremap <A-space> <C-o>:TermExec cmd='deno run %'<cr>
nmap <A-space> :TermExec cmd='deno run %'<cr>

" js formatter; npm -g install js-beautify
nmap <A-p> :%!js-beautify<cr><cr>
im <A-p> <C-o>:%!js-beautify<cr><cr>
