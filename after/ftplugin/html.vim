set tabstop=2
set shiftwidth=2
set softtabstop=2
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='i'    "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','
" colorscheme onedarker
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

" im df <C-j><CR>
" im fd <C-j><CR>
"""" ?
" nmap <C-Enter> <C-z>,
" im <M-c> <Esc>jcit
" nmap <M-c> <Esc>jcit

autocmd TextChanged,TextChangedI <buffer> silent write













" AUTO SAVE
" au BufRead,BufNewFile * let b:save_time = localtime()
" au CursorHold * call UpdateFile()
" let g:autosave_time = 1
"
" " save if needed / update the save_time after the save
" function! UpdateFile()
"   if((localtime() - b:save_time) >= g:autosave_time)
"       update
"       let b:save_time = localtime()
"   else
"       " just debugging info
"       echo "[+] ". (localtime() - b:save_time) ." seconds have elapsed so far."
"   endif
" endfunction
" au BufWritePre * let b:save_time = localtime()

" hi Normal		guifg=cyan			guibg=#1a1b26
" hi Comment	term=bold		ctermfg=DarkCyan		guifg=#464650
" hi Constant	term=underline	ctermfg=Magenta		guifg=Magenta
" hi Special	term=bold		ctermfg=DarkMagenta	guifg=Red
" hi Identifier term=underline	cterm=bold			ctermfg=Red guifg=#aa4646
" hi Statement term=bold		ctermfg=Yellow gui=bold	guifg=#aa4444
" hi PreProc	term=underline	ctermfg=LightBlue	guifg=#ff80ff
" hi Type	term=underline		ctermfg=LightGreen	guifg=#60ff60 gui=bold
" hi Function	term=bold		ctermfg=White guifg=#80804d
" hi Repeat	term=underline	ctermfg=White		guifg=white
" hi Operator				ctermfg=Red			guifg=Red
" hi Ignore				ctermfg=black		guifg=bg
" hi Error	term=reverse ctermbg=Red ctermfg=White guibg=Red guifg=White
" hi Todo	term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
