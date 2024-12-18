require("configs.keymaps")
require("configs.options")
require("configs.plugins")
-- require("configs.mycolors").setup()
require("configs.autocommand")
require("configs.whichkey")
require("configs.telescope")
require("configs.cmp")
require("configs.treesitter")
require("configs.luasnip")
require("configs.toggleterm")
-- require("configs.comment")
require("configs.lsp-conf")
require("configs.input").setup()
require("configs.bufferline")
-- require("configs.colorscheme")
require("configs.statuslineOld")
-- require("configs.statusline")
-- require("configs.new-statusline")
-- require("configs.cssHighlight")

local ft = require('Comment.ft')
require('snacks')
--1. Using method signature
-- Set only line comment or both
-- You can also chain the set calls
-- ft.set('yaml', '#%s').set('javascript', {'//%s', '/*%s*/'})
-- ft.set('lua', '---%s').set('javascript', {'//%s', '/*%s*/'})

-- useful for recordeing video
-- vim.opt.guicursor = "i-ci:ver30-iCursor-blinkwait100-blinkon200-blinkoff9999"
-- require("configs.bubbleline")


-- Lua
-- require('onedark').setup { style = 'deep' }
-- require('onedark').load()
-- vim.keymap.set({ "n" }, "<C-k>", "<cmd>TSHighlightCapturesUnderCursor<CR>")
vim.cmd[[ nmap co gcc ]]



-- {{{
-- require("code_runner").setup({ term = { size = 9 } })

-- require("configs.lsp")
-- require("configs.lualine")
-- require("leap").add_default_mappings()
-- require("configs.knap")

-- require('testing').setup({
--   greeting = "LEO",
--   greet_on_start = false
-- })

-- require('configs.codeRuner').setup({
--   term_size = 10,
--   direction = 'horizontal',
--   compiler = {
--     javascript = 'bun run',
--     typescript = 'bun run',
--     -- lua        = 'lua', rust        = 'rustc % && ./%<', c          = 'gcc % -o %< && ./%<', cpp          = 'g++ % -o %< && ./%< -lstdc++',
--     python     = 'python'
--   }
-- })

-- require('ranar').setup({
--   -- terminal_cmd = "term://bash", -- change the default shell
--   -- direction = "horizontal",
--   -- size = 12,
--   -- terminal_direction = 'horizontal',
--   -- terminal_size = 12,

--   -- terminal_direction = 'vertical',
--   -- terminal_size = '8',
--   compilers = {
--     javascript = 'bun run',
--     typescript = 'bun run',
--     lua        = 'lua',
--     -- rust        = 'rustc % && ./%<',
--     -- c          = 'gcc % -o %< && ./%<',
--     -- cpp          = 'g++ % -o %< && ./%< -lstdc++',
--     python     = 'python'
--     -- other filetypes and their compilers
--   }
-- })


-- require("supermaven-nvim").setup({
--   keymaps = {
--     accept_suggestion = "<A-[>",
--     clear_suggestion = "<C-]>",
--   },
--   ignore_filetypes = { cpp = true },
--   color = {
--     suggestion_color = "#804d66",
--     cterm = 244,
--   }
-- })
-- }}}
-- {{{
require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        html = { "prettierd", "prettier" },
        css = { "prettierd" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
    },
})

-- }}}

-- fold{{{
vim.cmd [[
function! NeatFoldText()
    let line = getline(v:foldstart)

    " Remove comment characters based on filetype
    if &filetype == 'html'
        let line = substitute(line, '^\s*<!--\s*\|\s*-->\s*<!--\s*\|\s*-->\s*', '', 'g')
    elseif &filetype == 'css'
        let line = substitute(line, '^\s*/\*\s*\|\s*\*/\s*', '', 'g')
    elseif &filetype == 'javascript' || &filetype == 'typescript'
        let line = substitute(line, '^\s*//\s*\|^\s*/\*\s*\|\s*\*/\s*', '', 'g')
    endif

    " Remove Vim/Vimscript comments and fold markers
    let line = substitute(line, '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g')

    let line = '⊚ ' . line . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '─────❭❱ (' . printf("%10s", lines_count . ' lines)') . ' ' . printf("%200s",' ')
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart(' ' . repeat(foldchar, v:foldlevel*0) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . foldtextend . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()


hi Folded guibg=NONE guifg=#FF0063 gui=bold cterm=bold
]]
-- }}}

-- require('configs.mycolors').setup({
--     colors = {
--         bg = "#000000",
--     },
--     extra_groups = {
--         CursorLine          = { bg = "#1a1a1a" },
--         LineNr          = { fg = "#1a1a1a" },
--         Whitespace          = { fg = "#1a1a1a" },
--     }
-- })

vim.cmd [[colorscheme neodark]]

local markview = require("markview");
local presets = require("markview.presets");

markview.setup({
    headings = presets.headings.glow_labels
});

vim.cmd("Markview enableAll");
vim.cmd[[ hi! @markup.raw.block guibg=#233333]]

