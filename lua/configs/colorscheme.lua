-- vim.cmd([[ colorscheme onecolor ]])

----> LETS OVERWRITE COLOR SCHEME
local hilight=vim.cmd.highlight
local overWriteColors = {
    MsgArea             = "guifg=#00ff98",                          --> message area's textcolor
    CursorLine          = "guibg=#232534",                          --> cursorLine background
    LineNr              = "guifg=#233d46",                          --> left side line number
    CursorLineNr        = "guifg=#247c99 term=bold gui=bold",       --> current line number
    Folded              = "guibg=#1e202c guifg=#585992",                          --> fold text color
    Search              = "guibg=#2c3841",                          --> search text color
    comment             = "guifg=#5f4f5f",                          --> comment color
    MatchParen          = "guibg=#2f3c41 guifg=#80b3e6",            --> MatchParen ('()') color
    Statusline          = "guifg=#356191 guibg=Normal",             --> statusline of current window
    StatusLineNC        = "guifg=#356191 guibg=Normal",             --> statusline of non-current window
    signcolumn          = "guibg=#1a1b26",                          --> signcolumn color
    FloatBorder         = "guifg=#2a2b36",                          --> floting window border
    TabLine             = "guibg=#1a1b26 guifg=#3a3b36 gui=NONE",   --> tab pages line, not active tab page label
    TabLineFill         = "guibg=#1a1b26 guifg=#1a1b26",            --> tab pages line, where there are no labels
    TabLineSel          = "guibg=#ffff44 guifg=#00000",             --> tab pages line, active tab page label
    NormalSB            = "guibg=#1a1b26 guifg=#4d4d4d",            --> Normal text in floating windows.
    VisualNOS           = "guibg=#333333",                          --> Visual mode selection when vim is "Not Owning the Selection".
    LazyNormal           = "guibg=#252631",                         --> border for lazy nvim
    ----> telescope/plugin{{{
   -- TelescopeBorder     ="guifg=#9986c7 guibg=NONE",
   -- TelescopeMatching   ="guifg=#e6e600 gui=bold",
   MiniIndentscopeSymbol = "guifg=#666699",
   IndentBlanklineChar   = "guifg=#2a2929",-- }}}
}

for k,v in pairs(overWriteColors) do
    hilight({k,v})
end


----> colorscheme for CSS
local cssColor = {
  left                  = 'guifg=#778cd9',
  right                 = 'guifg=#ff6480',
  dim                   = 'guifg=#504156',
  braces                = 'guifg=#494a55',
  selector              = 'guifg=#ff814d guibg=#252631 gui=bold',
  --> another variation{{{
  -- right                 = 'guifg=#c7c300',
  -- left                  = 'guifg=#ff6480',
  -- dim                   = 'guifg=#504156',
  -- braces                = 'guifg=#8043b3',
  -- selector              = 'guifg=#9567d9 guibg=#2b2c37 gui=bold',}}}
}

local cssHighlight = {
  cssBraces             = cssColor.braces,                    --> selector block bracket
  cssClassName          = cssColor.selector,                  --> class name
  cssPseudoClassId      = cssColor.selector,                  --> pseudo class id
  cssPseudoClass        = cssColor.selector,                  --> pseudo class
  cssTagName            = cssColor.selector,                  --> tag name
  cssClassNameDot       = cssColor.selector,                  --> class name dot
  cssImportant          = cssColor.right,                     --> !important keyword color
  cssAttr               = cssColor.right,                     --> css attribute like none , color, font-size
  number                = cssColor.right,                     --> any number
  cssUnitDecorators     = cssColor.right,                     --> rem, px etc
  cssColor              = cssColor.right,                     --> css color for transparent,
  cssFontAttr           = cssColor.right,                     --> css font like sans-serif, serif
  cssFunctionName       = cssColor.left,                     --> url/rbga keyword
  cssSelectorOp         = cssColor.left,                      --> selector operator like > +
  cssSelectorOp2        = cssColor.left,                      --> second selector operator
  cssProp               = cssColor.left,                      --> css property
  cssNoise              = cssColor.dim,                       --> things like :,;
  cssAttrComma          = cssColor.left,                      --> attribute comma
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
--> Trash{{{
---------------------------------------------------------------------------------
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

--[[ local tt = {
  dim                 = 'guifg=#504156',
  Pmenu               = "guibg=#1a1b26",
  -- PmenuSel            = "guibg=#262732", -- Popup menu: selected item.
  -- PmenuSbar           = "guibg=#1a1b26", -- Popup menu: scrollbar.
  PmenuThumb          = "guibg=#1a1b26", -- Popup menu: Thumb of the scrollbar.
  NormalFloat         = "guibg=#1a1b26 blend = 5 ", -- Normal text in floating windows.
  FloatBorder         = "guifg=#2a2b36",
  NormalSB            = "guibg=#1a1b26 guifg=#4d4d4d", -- Normal text in floating windows.
  Visual              = "guibg=#313c6a",
  VisualNOS           = "guibg=#333333", -- Visual mode selection when vim is "Not Owning the Selection".
  TabLine             = "guibg=#1a1b26 guifg=#3a3b36 gui=NONE", -- tab pages line, not active tab page label
  TabLineFill         = "guibg=#1a1b26 guifg=#1a1b26", -- tab pages line, where there are no labels
  TabLineSel          = "guibg=#ffff44 guifg=#00000", -- tab pages line, active tab page label
} ]]-- }}}
