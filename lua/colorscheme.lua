-----------------------> set colorscheme -------------------->
-- vim.cmd([[colorscheme onedarker]])
vim.cmd([[colorscheme tokyonight-night]])

--───────────────── CUSTOM COLOR CONFIG ──────────────────────
vim.cmd([[ hi MsgArea guifg = '#00ff98' ]]) --> cmd/MsgArea color
vim.cmd([[ hi CursorLine guibg = '#232534' ]]) --> current/cursor line color#292e42
-- vim.cmd [[ hi CursorLine guibg = '#292e42' ]] --> current/cursor line color#292e42
vim.cmd([[ hi LineNr guifg = '#233d46' ]]) --> numbers color
vim.cmd([[ hi MatchParen guifg=#ffff00]]) --> MatchParen ('()') color
vim.cmd([[ hi MatchParen ctermbg=blue guibg=#2f3c41]])
vim.cmd([[ hi CursorLineNr   term=bold gui=bold guifg=#247c99]]) --> current line number color
vim.cmd([[hi VertSplit guibg=bg guifg=#e6e600 ]]) --> current line number color

vim.cmd([[hi Folded guibg =#1a1c28 guifg=#4d4d54 ]]) --> fold line color
-- vim.cmd [[hi Visual guibg =#30455c]] --> visual selection color
-- vim.cmd [[hi Search guibg =#1b1966]] --> search color
-- vim.cmd [[ hi comment guifg=#350050 ]] --> comment color
-- vim.cmd [[ hi GitSign guifg = NONE guibg = NONE ]]
-- vim.cmd [[hi NonText guifg = bg ]]
-- vim.cmd [[ hi Normal guibg =  '#292d3e' ]]
-- vim.cmd [[ hi CursorLineNr   term=bold gui=bold guifg=black]]

----------> change default color of hop -------------->
vim.cmd([[
hi HopNextKey guifg=yellow
hi	HopNextKey1 guifg= yellow
hi	HopNextKey2 guifg= yellow
hi	HopUnmatched guifg= grey
hi	HopPreview guifg=#c7bA7
]])

-----------------> config for neovide --------------->
vim.cmd([[
let g:neovide_transparency=0.96
let g:neovide_floating_blur_amount_x = 2.0
let g:neovide_floating_blur_amount_y = 2.0

" let g:neovide_scale_factor = 1.4
" let g:neovide_hide_mouse_when_typing = v:true
" let g:neovide_underline_automatic_scaling = v:true
" let g:neovide_refresh_rate = 60
" let g:neovide_no_idle = v:true
let g:neovide_confirm_quit = v:false
]])
