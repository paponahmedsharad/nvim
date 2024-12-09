local M = {}

-- Define default colors
M.default_colors = {
    bg = "#1a1a1a",
    fg = "#e0e0e0",
    blue = "#4e88d6",
    light_blue = "#7aa2e0",
    yellow = "#e6c446",
    light_yellow = "#f0d787",
    gray = "#666666",
    comment = "#4a4a4a",
    selection = "#264f78"
}

-- Function to merge user-defined colors with default colors
local function merge_colors(user_colors)
    local colors = vim.tbl_extend("force", M.default_colors, user_colors or {})
    return colors
end

-- Define highlight groups
local function define_highlight_groups(colors)
    return {
        -- Editor
        Normal = { fg = colors.fg, bg = colors.bg },
        LineNr = { fg = colors.gray },
        CursorLine = { bg = colors.selection },
        CursorLineNr = { fg = colors.light_yellow },
        MatchParen = { fg = colors.light_blue, bold = true },
        Whitespace = { fg = colors.blue },

        -- Syntax
        Comment = { fg = colors.comment, italic = true },
        Constant = { fg = colors.light_yellow },
        String = { fg = colors.yellow },
        Identifier = { fg = colors.light_blue },
        Function = { fg = colors.blue },
        Statement = { fg = colors.blue },
        Keyword = { fg = colors.blue },
        PreProc = { fg = colors.light_blue },
        Type = { fg = colors.light_yellow },
        Special = { fg = colors.light_blue },

        -- UI
        StatusLine = { fg = colors.fg, bg = colors.selection },
        StatusLineNC = { fg = colors.gray, bg = colors.bg },
        VertSplit = { fg = colors.gray, bg = colors.bg },
        Visual = { bg = colors.selection },


        -- HTML
        htmlTag = { fg = colors.light_blue },
        htmlEndTag = { fg = colors.light_blue },
        htmlTagName = { fg = colors.blue },
        htmlArg = { fg = colors.light_yellow },

        -- CSS

        cssBraces = { fg = colors.fg },
        cssTagName = { fg = colors.blue },
        cssClassName = { fg = colors.light_yellow },
        cssIdentifier = { fg = colors.light_yellow },
        cssProp = { fg = colors.light_blue },
        cssAttr = { fg = colors.yellow },

        -- JavaScript
        javaScriptBraces = { fg = colors.fg },
        javaScriptFunction = { fg = colors.blue },
        javaScriptIdentifier = { fg = colors.light_blue },
        javaScriptMember = { fg = colors.light_yellow },
        javaScriptNumber = { fg = colors.yellow },
        javaScriptNull = { fg = colors.yellow },
        javaScriptParens = { fg = colors.fg },


        IndentBlanklineContextChar = { fg = colors.comment, bg = colors.comment },
        IndentBlanklineContextStart = { fg = colors.comment, bg = colors.comment },
        IndentBlanklineChar = { fg = colors.comment, bg = colors.comment },

        -- which-key
        WhichKey = { fg = colors.light_blue },
        WhichKeyGroup = { fg = colors.blue },
        WhichKeyDesc = { fg = colors.light_yellow },
        WhichKeySeparator = { fg = colors.gray },
        WhichKeyFloat = { bg = colors.bg },

        -- nvim-cmp
        CmpItemAbbr = { fg = colors.fg },
        CmpItemAbbrDeprecated = { fg = colors.gray, strikethrough = true },
        CmpItemAbbrMatch = { fg = colors.light_blue, bold = true },
        CmpItemAbbrMatchFuzzy = { fg = colors.light_blue, bold = true },
        CmpItemKind = { fg = colors.light_yellow },
        CmpItemMenu = { fg = colors.gray },
    }
end

function M.setup(opts)
    opts = opts or {}
    local colors = merge_colors(opts.colors)

    -- Clear existing highlighting
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end

    -- Set colorscheme name
    vim.g.colors_name = opts.name or "blue_yellow_dark"

    -- Define and set highlight groups
    local groups = define_highlight_groups(colors)
    for group, styles in pairs(groups) do
        vim.api.nvim_set_hl(0, group, styles)
    end

    -- Apply any additional user-defined highlight groups
    if opts.extra_groups then
        for group, styles in pairs(opts.extra_groups) do
            vim.api.nvim_set_hl(0, group, styles)
        end
    end
end

return M
