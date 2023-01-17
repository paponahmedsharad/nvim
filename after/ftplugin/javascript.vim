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

" hi Constant	term=underline	ctermfg=Magenta		guifg=Magenta
hi Special	term=bold		ctermfg=DarkMagenta	guifg= #808000
hi Identifier term=underline	cterm=bold			ctermfg=Red guifg=#aa46e6
hi Statement term=bold		ctermfg=Yellow gui=bold	guifg=#aa4444
" hi PreProc	term=underline	ctermfg=LightBlue	guifg=#ff80ff
" hi Type	term=underline		ctermfg=LightGreen	guifg=#60ff60 gui=bold
hi Function	term=bold		ctermfg=Yellow guifg=#80804d
" hi Repeat	term=underline	ctermfg=White		guifg=Black
" hi Operator				ctermfg=Red			guifg=Red
" hi Ignore				ctermfg=black		guifg=bg
" hi Error	term=reverse ctermbg=Red ctermfg=White guibg=Red guifg=White
" hi Todo	term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
