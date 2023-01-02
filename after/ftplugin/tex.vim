"""""""""""""""""" Latex setup """"""""""""""""
let g:knap_settings = {
    \ "textopdfviewerlaunch": "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
    \ "textopdfviewerrefresh": "none",
    \ "textopdfforwardjump": "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%"
\ }

" PROCESSES THE DOCUMENT ONCE, AND REFRESHES THE VIEW "
inoremap <silent> <A-p> <C-o>:lua require("knap").process_once()<CR>
nnoremap <silent> <A-p> :lua require("knap").process_once()<CR>

" F6 closes the viewer application, and allows settings to be reset "
inoremap <silent> <A-c> <C-o>:lua require("knap").close_viewer()<CR>
nnoremap <silent> <A-c> :lua require("knap").close_viewer()<CR>

" F7 toggles the auto-processing on and off "
inoremap <silent> <A-m> <C-o>:lua require("knap").toggle_autopreviewing()<CR>
nnoremap <silent> <A-m> :lua require("knap").toggle_autopreviewing()<CR>

" Auto write
autocmd TextChanged,TextChangedI <buffer> silent write
" autocmd TextChanged,TextChangedI <buffer> silent lua require("knap").process_once()
