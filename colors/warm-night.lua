-- Clear existing highlighting and set defaults
vim.cmd('highlight clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end

vim.o.termguicolors = true
vim.g.colors_name = 'warm_night'

-- Color palette using HSL values
local colors = {
    background   = "hsl(0 0% 10%)",
    foreground   = "hsl(35 20% 85%)",
    darker       = "hsl(0 0% 8%)",
    dark         = "hsl(0 0% 12%)",
    lightbg      = "hsl(0 0% 15%)",
    red          = "hsl(0 70% 65%)",
    green        = "hsl(95 40% 65%)",
    yellow       = "hsl(40 70% 70%)",
    orange       = "hsl(25 70% 65%)",
    blue         = "hsl(210 50% 70%)",
    purple       = "hsl(280 50% 70%)",
    cyan         = "hsl(180 40% 70%)",
    grey         = "hsl(0 0% 50%)",
    light_grey   = "hsl(0 0% 65%)",
    comment      = "hsl(35 15% 50%)",
}

local function highlight(group, opts)
    local guifg = opts.fg and 'guifg=' .. opts.fg or 'guifg=NONE'
    local guibg = opts.bg and 'guibg=' .. opts.bg or 'guibg=NONE'
    local gui = opts.gui and 'gui=' .. opts.gui or 'gui=NONE'
    local guisp = opts.sp and 'guisp=' .. opts.sp or ''

    vim.cmd(string.format('highlight %s %s %s %s %s', group, guifg, guibg, gui, guisp))
end

-- Editor colors
highlight('Normal', { fg = colors.foreground, bg = colors.background })
highlight('NormalFloat', { fg = colors.foreground, bg = colors.dark })
highlight('SignColumn', { fg = colors.foreground, bg = colors.background })
highlight('EndOfBuffer', { fg = colors.grey })
highlight('NormalNC', { fg = colors.foreground, bg = colors.background })
highlight('Cursor', { fg = colors.background, bg = colors.foreground })
highlight('CursorLine', { bg = colors.lightbg })
highlight('CursorColumn', { bg = colors.lightbg })
highlight('LineNr', { fg = colors.grey })
highlight('CursorLineNr', { fg = colors.yellow, gui = 'bold' })

-- Syntax colors
highlight('Comment', { fg = colors.comment, gui = 'italic' })
highlight('String', { fg = colors.green })
highlight('Number', { fg = colors.orange })
highlight('Constant', { fg = colors.purple })
highlight('Statement', { fg = colors.red, gui = 'bold' })
highlight('Type', { fg = colors.blue })
highlight('Function', { fg = colors.yellow })
highlight('Identifier', { fg = colors.cyan })
highlight('Special', { fg = colors.orange })
highlight('PreProc', { fg = colors.purple })
highlight('Operator', { fg = colors.red })
highlight('Keyword', { fg = colors.red, gui = 'bold' })

-- UI elements
highlight('Visual', { bg = colors.lightbg })
highlight('Search', { fg = colors.background, bg = colors.yellow })
highlight('IncSearch', { fg = colors.background, bg = colors.orange })
highlight('Pmenu', { fg = colors.foreground, bg = colors.dark })
highlight('PmenuSel', { fg = colors.background, bg = colors.yellow })
highlight('PmenuSbar', { bg = colors.dark })
highlight('PmenuThumb', { bg = colors.grey })
highlight('StatusLine', { fg = colors.foreground, bg = colors.dark })
highlight('StatusLineNC', { fg = colors.light_grey, bg = colors.darker })
highlight('VertSplit', { fg = colors.grey, bg = colors.background })
highlight('Folded', { fg = colors.grey, bg = colors.dark })
highlight('FoldColumn', { fg = colors.grey, bg = colors.background })

-- Diagnostic colors
highlight('DiagnosticError', { fg = colors.red })
highlight('DiagnosticWarn', { fg = colors.yellow })
highlight('DiagnosticInfo', { fg = colors.blue })
highlight('DiagnosticHint', { fg = colors.cyan })

-- Git colors
highlight('DiffAdd', { fg = colors.green, bg = colors.dark })
highlight('DiffChange', { fg = colors.yellow, bg = colors.dark })
highlight('DiffDelete', { fg = colors.red, bg = colors.dark })
highlight('DiffText', { fg = colors.foreground, bg = colors.dark })
