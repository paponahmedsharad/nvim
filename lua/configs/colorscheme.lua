----> LETS OVERWRITE COLOR SCHEME
local hilight=vim.cmd.highlight
local overWriteColors = {
    MsgArea             = "guifg=#00ff98",                              --> message area's textcolor
    CursorLine          = "guibg=#232534",                              --> cursorLine background
    LineNr              = "guifg=#233d46",                              --> left side line number
    CursorLineNr        = "guifg=#247c99 term=bold gui=bold",           --> current line number
    Folded              = "guibg=#1a1c28",                              --> fold text color
    Search              = "guibg=#2c3841",                              --> search text color
    comment             = "guifg=#5f4f5f",                              --> comment color
    MatchParen          = "guibg=#2f3c41 guifg=#80b3e6",                --> MatchParen ('()') color
    Statusline          = "guifg=#356191 guibg=normal",                 --> statusline of current window
    StatusLineNC        = "guifg=#356191 guibg=Normal",                 --> statusline of non-current window
}

for k,v in pairs(overWriteColors) do
    hilight({k,v})
end



----> colorscheme for CSS
local cssColor = {
  left                  = 'guifg=#778cd9',
  right                 = 'guifg=#ff6480',
  dim                   = 'guifg=#504156',
  braces                = 'guifg=#42434e',
  selector              = 'guifg=#ff814d guibg=#31323d gui=bold',
  -- selector                   = "guifg=#b0e600 guibg=NONE gui=bold",
}

local cssHighlight = {
  cssBraces             = cssColor.braces,           --> selector block bracket 
  cssClassName          = cssColor.selector,         --> class name
  cssPseudoClassId      = cssColor.selector,         --> psudo class id 
  cssPseudoClass        = cssColor.selector,         --> psudo class
  cssTagName            = cssColor.selector,         --> tag name
  cssClassNameDot       = cssColor.selector,         --> class name dot
  cssFunctionName       = cssColor.selector,         --> url keyword
  cssImportant          = cssColor.right,            --> !important keyword color
  cssAttr               = cssColor.right,            --> css attribute like none , color, font-size
  number                = cssColor.right,            --> any number
  cssUnitDecorators     = cssColor.right,            --> rem, px etc
  cssColor              = cssColor.right,            --> css color for transparent,
  cssFontAttr           = cssColor.right,            --> css font like sans-serif, serif
  cssSelectorOp         = cssColor.left,             --> selector operator like > + 
  cssSelectorOp2        = cssColor.left,             --> second selector operator
  cssProp               = cssColor.left,             --> css property
  cssNoise              = cssColor.dim,              --> things like :,;
  cssAttrComma          = cssColor.left,             --> attribute comma
}

for group, color in pairs(cssHighlight) do
  vim.cmd('highlight ' .. group .. ' ' .. color)
end



----> no statusline
vim.cmd([[
set laststatus=0
set statusline=%{repeat('─',winwidth('.'))}
]])


---------------------------------------------------------------------------------
--> Trash
---------------------------------------------------------------------------------
-- vim.cmd([[ hi MsgArea guifg = '#00ff98' ]]) --> cmd/MsgArea
-- vim.cmd([[ hi CursorLine guibg = '#232534' ]]) --> cursor line
-- vim.cmd([[ hi LineNr guifg = '#233d46' ]]) --> numbers color
-- vim.cmd([[ hi MatchParen guifg=#80b3e6]]) --> MatchParen ('()') color
-- vim.cmd([[ hi MatchParen ctermbg=blue guibg=#2f3c41]])
-- vim.cmd([[ hi CursorLineNr   term=bold gui=bold guifg=#247c99]]) --> current line number
-- vim.cmd([[ hi Folded guibg =#1a1c28 guifg=#4d4d54 ]]) --> fold line color
-- vim.cmd([[ hi Search guibg =#2c3841]]) --> search result color
-- vim.cmd([[ hi comment guifg=#5f4f5f ]]) --> comment color

-- vim.cmd([[hi VertSplit guibg=bg guifg=#e6e600 ]]) --> win spliting line color
-- vim.cmd [[hi Visual guibg =#30455c]] --> visual selection color
-- vim.cmd [[ hi GitSign guifg = NONE guibg = NONE ]]
-- vim.cmd [[hi NonText guifg = bg ]]
-- vim.cmd [[ hi Normal guibg =  '#292d3e' ]]
-- vim.cmd [[ hi CursorLineNr   term=bold gui=bold guifg=black]]

-- vim.cmd([[
-- " hi! Statusline Guifg=#356191 Guibg=normal
-- " hi! StatusLineNC guifg=#356191  guibg=Normal
-- ]])

