" setlocal foldmethod=indent

"--> auto write on change
autocmd TextChanged,TextChangedI <buffer> silent write

"---> select the first item from lsp/cmp
" im df <C-j><CR>
" im fd <C-j><CR>

"""" select the first item from lsp/cmp
" im dk <C-k><CR>
" im kd <C-k><CR>

""" source/compile result in terminal"""
" inoremap <A-space> <C-o>:TermExec cmd='lua %'<cr>
" nmap <A-space> :TermExec cmd='lua %'<cr>




"-----> trash
" nmap <A-m> V#:noh<cr>
" im <A-m> <Esc>
" noremap <expr> <A-m> ':s/\<'.expand('<cword>').'\>/"&"/<CR>:noh<cr>A'
" im <expr> <C-g> '<Left><Esc>:s/\<'.expand('<cword>').'\>/"&"/<CR>:noh<cr>A'





" move line or visually selected block - alt+j/k
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv

" " move split panes to left/bottom/top/right
 " nnoremap <A-h> <C-W>H
 " nnoremap <A-j> <C-W>J
 " nnoremap <A-k> <C-W>K
 " nnoremap <A-l> <C-W>L
 " " move between panes to left/bottom/top/right
 " nnoremap <C-h> <C-w>h
 " nnoremap <C-j> <C-w>j
 " nnoremap <C-k> <C-w>k
 " nnoremap <C-l> <C-w>l

" copies pwd to clipboard: command yd
" nnoremap <silent> yd :let @+=expand('%:p:h')<CR>
