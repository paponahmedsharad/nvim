set tabstop=2
set shiftwidth=2
set softtabstop=2

"""" select the first item from lsp/cmp
" im df <C-j><CR>
" im fd <C-j><CR>
" imap df <C-j><CR> <Esc>
" imap fd <C-j><CR> <Esc>

"---> make a lsp snippets
" im fr : ;<Left>
" im rf : ;<Left>

" nmap jp <Esc>yisvis<Space>/}p
" nmap pj <Esc>yisvis<Space>/}p


" AUTO SAVE
" autocmd TextChanged,TextChangedI <buffer> silent write


"================colorscheme===============
hi Normal		guifg=#8099e6  			guibg=#1a1b26
hi Comment	term=bold		ctermfg=Black		guifg=#1a1a1a
hi Type	term=underline		ctermfg=Black	guifg=#5bdb00  gui=bold
