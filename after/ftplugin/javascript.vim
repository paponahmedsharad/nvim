set tabstop=4
set shiftwidth=4
set softtabstop=4

" autocmd TextChanged,TextChangedI <buffer> silent write

"""" Run the code in a terminal
" NODEJS
" inoremap <A-space> <C-o>:TermExec cmd='node %'<cr>
" nmap <A-space> :TermExec cmd='node %'<cr>
" bun
" inoremap <A-space> <C-o>:TermExec cmd='bun run %'<cr>
nmap <A-space> :TermExec cmd='bun run %'<cr>

" js formatter; npm -g install js-beautify
nmap <A-p> :%!js-beautify<cr><cr>
im <A-p> <C-o>:%!js-beautify<cr><cr>

" Vim syntax file
"      Language: JavaScript
"    Maintainer: Jose Elera Campana <https://github.com/jelera>
" Last Modified: Wed 24 Feb 2016 03:35:03 AM CST
"       Version: 0.8.2
"       Credits: Zhao Yi, Claudio Fleiner, Scott Shattuck (This file is based
"                on their hard work), gumnos (From the #vim IRC Channel in
"                Freenode), all the contributors at this project's github page
"                (https://github.com/jelera/vim-javascript-syntax/graphs/contributors)

" if !exists("main_syntax")
" 	if version < 600
" 		syntax clear
" 	elseif exists("b:current_syntax")
" 		finish
" 	endif
" 	let main_syntax = 'javascript'
" endif

" TODO
" hi Keyword           guifg=#5674b4 gui=bold
" hi @punctuation.bracket guifg=#ffff00
" hi! @variable.builtin   guifg=#000000
" hi Identifier           guifg=#56e600 gui=bold
