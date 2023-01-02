set tabstop=2
set shiftwidth=2
set softtabstop=2

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
