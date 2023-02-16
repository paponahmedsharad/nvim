--> LETS OVERWRITE COLOR SCHEME
vim.cmd([[
set laststatus=0
hi! Statusline Guifg=#356191 Guibg=normal
hi! StatusLineNC guifg=#356191  guibg=Normal
set statusline=%{repeat('─',winwidth('.'))}
]])

vim.cmd([[ hi MsgArea guifg = '#00ff98' ]]) --> cmd/MsgArea
vim.cmd([[ hi CursorLine guibg = '#232534' ]]) --> cursor line
-- vim.cmd [[ hi CursorLine guibg = '#292e42' ]] --> current/cursor
vim.cmd([[ hi LineNr guifg = '#233d46' ]]) --> numbers color
vim.cmd([[ hi MatchParen guifg=#80b3e6]]) --> MatchParen ('()') color
vim.cmd([[ hi MatchParen ctermbg=blue guibg=#2f3c41]])
vim.cmd([[ hi CursorLineNr   term=bold gui=bold guifg=#247c99]]) --> current line number
vim.cmd([[ hi Folded guibg =#1a1c28 guifg=#4d4d54 ]]) --> fold line color
vim.cmd([[ hi Search guibg =#2c3841]]) --> search result color
vim.cmd([[ hi comment guifg=#5f4f5f ]]) --> comment color

-- vim.cmd([[hi VertSplit guibg=bg guifg=#e6e600 ]]) --> win spliting line color
-- vim.cmd [[hi Visual guibg =#30455c]] --> visual selection color
-- vim.cmd [[ hi GitSign guifg = NONE guibg = NONE ]]
-- vim.cmd [[hi NonText guifg = bg ]]
-- vim.cmd [[ hi Normal guibg =  '#292d3e' ]]
-- vim.cmd [[ hi CursorLineNr   term=bold gui=bold guifg=black]]

