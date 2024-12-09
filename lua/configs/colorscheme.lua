-- vim.cmd([[ colorscheme onecolor ]])

----> LETS OVERWRITE COLOR SCHEME
local hilight=vim.cmd.highlight

-- local background= "guibg=#2e3440"
local red= "guibg=#ff3440"
local background= "guibg=#2f3541"
local background2= "guibg=#3B4252"
local floatstyle = "guibg=#383e4a guifg=#383e4a"




local overWriteColors = {
    NormalFloat = "guibg=#383e4a",
    FloatBorder  = floatstyle,
    Dcolor = "guibg=#383e4a",
    Fcolor = "guifg=#2f3541 guibg=#2f3541",

    WhichKeyFloat =background2,
    TelescopeNormal = background, --> finds file result window
    TelescopeBorder = background, --> border/area around the border line
    WhichKeyBorder = "guifg=#3B4252 guibg=#3B4252",
    -- TelescopePromptNormal = red, --> find files number 12/12
    -- TelescopeResultsBorder = red,
    -- TelescopeSelectionCaret
    -- TelescopeMatching
    -- TelescopePromptTitle
    -- TelescopePromptPrefix
    -- TelescopePromptBorder
    -- TelescopePreviewTitle
    -- TelescopePreviewBorder
    -- TelescopeResultsTitle
    MsgArea             = "guifg=#00ff98",                          --> message area's textcolor
    -- CursorLine          = "guibg=#232534",                          --> cursorLine background
    CursorLine          = "guibg=#3e3d49",                          --> cursorLine background
    -- Normal          = "guibg=#242830",                          --> cursorLine background
    -- LineNr              = "guifg=#233d46",                          --> left side line number
    -- LineNr              = "guifg=#142e37",                          --> left side line number
    LineNr              = "guifg=#393f4e",                          --> left side line number
    CursorLineNr        = "guifg=#246b83 term=bold gui=bold",       --> current line number
    Folded              = "guibg=#3d3f52 guifg=#8099ff gui=bold",            --> fold text color
    Search              = "guibg=#2c3841",                          --> search text color
    comment             = "guifg=#6f5b6f",                          --> comment color
    MatchParen          = "guibg=#2f3c41 guifg=#80b3e6",            --> MatchParen ('()') color
    -- Statusline          = "guifg=#356191 guibg=Normal",             --> statusline of current window
    -- StatusLineNC        = "guifg=#356191 guibg=Normal",             --> statusline of non-current window
    -- signcolumn          = "guibg=#232332",                          --> signcolumn color
    SignColumn          = background,                          --> signcolumn color
    FoldColumn          = "guifg=#6c4d99",                          --> signcolumn sign color
    -- SignColumn          = "guibg=#282C34",                          --> signcolumn color
    -- FloatBorder         = "guifg=#2a2b36",                          --> floting window border
    TabLine             = "guibg=#232332 guifg=#3a3b36 gui=NONE",   --> tab pages line, not active tab page label
    TabLineFill         = "guibg=#232332 guifg=#1a1b26",            --> tab pages line, where there are no labels
    TabLineSel          = "guibg=#ffff44 guifg=#00000",             --> tab pages line, active tab page label
    NormalSB            = "guibg=#2e3440 guifg=#4d4d4d",            --> Normal text in floating windows.
    VisualNOS           = "guibg=#333333",                          --> Visual mode selection when vim is "Not Owning the Selection".
    LazyNormal          = "guibg=#252631",                         --> border for lazy nvim
    ----> telescope/plugin{{{
   -- TelescopeBorder     ="guifg=#9986c7 guibg=NONE",
   -- TelescopeMatching   ="guifg=#e6e600 gui=bold",
   MiniIndentscopeSymbol = "guifg=#666699",
   IndentBlanklineChar   = "guifg=#2a2929",-- }}}

  -- WhichKey            Function      the key
  -- WhichKeyGroup       Keyword       a group
  -- WhichKeySeparator   DiffAdd       the separator between the key and its
  -- WhichKeyDesc        Identifier    the label of the key
  -- WhichKeyFloat       NormalFloat   Normal in the popup window
  -- WhichKeyBorder      FloatBorder   Normal in the popup window
  -- WhichKeyValue       Comment       used by plugins that provide values

    -- WhichKey            = "guifg=#ff00cc gui=bold",
    WhichKey            = "guifg=#ffff00 gui=bold",
    WhichKeyGroup       = "guifg=#66a7ff gui=bold",
    WhichKeySeparator    = "guifg=#676f89",
    WhichKeyDesc        = "guifg=#d9a74a gui=italic",
    -- WhichKeyValue        = "guifg=#e63300",

    -- MiniIndentscopeSymbol = "guifg=#000",
}

for k,v in pairs(overWriteColors) do
    hilight({k,v})
end



---
-- local jsColor = {{{{
--   braces                = 'guifg=#494a55',
--   selector              = 'guifg=#ff814d guibg=#252631 gui=bold',
--   constant              = 'guifg=#ff814d guibg=#252631 gui=bold',
-- }

-- local jsHighlight = {
--     javaScript           = jsColor.constant,
--     javaScriptIdentifier = jsColor.constant,
--     javaScriptFunction   = jsColor.constant,
--     javaScriptParens     = jsColor.constant,
--     javaScriptBraces     = jsColor.constant,
--     javaScriptNumber     = jsColor.constant,
--     javaScriptConstant   = jsColor.constant,
-- }

-- for group, color in pairs(jsHighlight) do
--   vim.cmd('highlight ' .. group .. ' ' .. color)
-- end

-- vim.cmd[[hi! javaScriptIdentifier guifg=#000000]]
--}}}

----> no statusline
-- vim.cmd([[
-- set laststatus=0
-- set statusline=%{repeat('─',winwidth('.'))}
-- ]])

-- Show cursor only on current window
vim.cmd[[
autocmd WinEnter    * set cursorline
autocmd WinLeave    * set nocursorline
" change cursorline color based on mode
" autocmd InsertEnter * hi CursorLine       guibg=Normal
" autocmd InsertLeave * hi CursorLine       guibg=#3e3d49
" autocmd InsertLeave * hi CursorLine       guibg=Normal
]]


-- overWriteColors for mini file browser
vim.cmd([[
hi MiniFilesBorder guifg= #2a2b36 guibg=#2a2b36
hi MiniFilesBorderModified guibg=white guifg=white
" hi MiniFilesDirectory` - t
" hi MiniFilesFile` - text r
hi MiniFilesNormal guibg=#2a2b36
hi MiniFilesTitle guibg=blue
hi MiniFilesTitleFocused guibg=red guifg=#000000
]])
---------------------------------------------------------------------------------
--> Trash{{{
---------------------------------------------------------------------------------
-- vim.cmd([[hi VertSplit guibg=bg guifg=#e6e600 ]]) --> win spliting line color
-- vim.cmd [[hi Visual guibg =#30455c]] --> visual selection color
-- vim.cmd [[ hi GitSign guifg = NONE guibg = NONE ]]
-- vim.cmd [[hi NonText guifg = bg ]]
-- vim.cmd [[ hi Normal guibg =  '#292d3e' ]]
-- vim.cmd [[ hi Normal guibg =  '#232332' ]]
-- vim.cmd [[ hi CursorLineNr   term=bold gui=bold guifg=black]]

-- vim.cmd([[
-- " hi! Statusline Guifg=#356191 Guibg=normal
-- " hi! StatusLineNC guifg=#356191  guibg=Normal
-- ]])

--[[ local tt = {
  dim                 = 'guifg=#504156',
  Pmenu               = "guibg=#232332",
  -- PmenuSel            = "guibg=#262732", -- Popup menu: selected item.
  -- PmenuSbar           = "guibg=#232332", -- Popup menu: scrollbar.
  PmenuThumb          = "guibg=#232332", -- Popup menu: Thumb of the scrollbar.
  NormalFloat         = "guibg=#232332 blend = 5 ", -- Normal text in floating windows.
  FloatBorder         = "guifg=#2a2b36",
  Visual              = "guibg=#313c6a",
  VisualNOS           = "guibg=#333333", -- Visual mode selection when vim is "Not Owning the Selection".
  TabLine             = "guibg=#232332 guifg=#3a3b36 gui=NONE", -- tab pages line, not active tab page label
  TabLineFill         = "guibg=#232332 guifg=#1a1b26", -- tab pages line, where there are no labels
  TabLineSel          = "guibg=#ffff44 guifg=#00000", -- tab pages line, active tab page label
} ]]-- }}}
