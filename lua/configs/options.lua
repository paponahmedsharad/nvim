--> CONTENTS (press alt+m to toggle)
--> some custom config

local options = {
    ttyfast = true,
    termguicolors = true,
    numberwidth = 1,
    foldcolumn = '2',
    -- guicursor="n:blinkon20",
    guicursor = "i-ci:ver30-iCursor-blinkwait100-blinkon200-blinkoff150",
    -- guifont = { "AestheticIosevka Nerd Font Mono", ":h14" },
    -- guifont = { "CodeNewRoman Nerd Font Mono", ":h18" },
    -- autowrite = true,
    clipboard = "unnamedplus", --> system clipboard
    backup = false,         -- creates a backup file
    number = true,          --> shows number
    relativenumber = true,  --> relative number style
    signcolumn = "yes",     --> always show the sign column, otherwise it would shift the text each time
    -- showtabline = 2,        --> always show tabs
    smarttab = true,        --> When on, a <Tab> in front of a line inserts blanks according to shiftwidth
    showmode = true,       --> we don't need to see things like -- INSERT -- anymore
    showcmd = false,        --> Show (partial) command in the last line of the screen
    -- shortmess = "IqcFWoOcT",   --> This option helps to avoid all the |hit-enter| prompts
    shortmess = "mnwaoIcCFT", --> This option helps to avoid all the |hit-enter| prompts
    hidden = true,          --> required to keep multiple buffers and open multiple buffers
    cursorline = true,      --> show cursorline
    swapfile = false,       --> no swap
    hlsearch = true,        --> highlight search
    incsearch = true,
    ignorecase = true,      --> ignorecase in search
    smartcase = true,
    -- undofile = true, --> enable persistent undo
    mouse = "nv", --> mouse only for normal and visual mode
    matchpairs = "(:),{:},[:]",

    scrolloff = 2,
    sidescrolloff = 2,
    updatetime = 200, --> faster completion (4000ms default)
    timeoutlen = 50, --> time to wait for a mapped sequence to complete (in milliseconds)

    wrap = false,  --> display lines as one long line
    whichwrap = "b,s,<,>,[,],h,l",
    pumheight = 10, --> item show in popup window,
    fileencoding = "utf-8",
    cmdheight = 0, --> height below status line
    splitbelow = true,
    splitright = true,

    -- copyindent = true,
    smartindent = true,
    autoindent = true,
    expandtab = true, -- convert tabs to spaces
    tabstop = 4,   -- insert 2 spaces for a tab
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    -- softtabstop = 4,
    -- no fold
    -- foldmethod = "manual",
    foldmethod = "marker",
    -- disable folding
    -- foldenable = false,




    --> new options
    completeopt = { "menuone", "noselect" },
    -- completeopt = {"menu,menuone,noinsert"},
    laststatus = 3, -- Global Status
    -- formatoptions = "crqnbj",
    formatoptions = "qjl1",
    -- set.conceallevel = 2
}

for key, value in pairs(options) do
    vim.opt[key] = value
end

--> some custom config
-- vim.cmd [[ set iskeyword+=-,.]] --> use this for change change/delete text connected by -,.

--> Disable various builtin plugins that bog down speed
-- vim.did_load_filetypes = 0
-- vim.do_filetype_lua = 1
local builtins = {
    -- "matchit",
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "tar",
    "tarPlugin",
    "rrhelper",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "tutor_mode_plugin",
    "fzf",
    "spellfile_plugin",
    "shada_plugin",
    "remote_plugins",
}

for _, plugin in ipairs(builtins) do
    vim["loaded_" .. plugin] = 1
end

local o = vim.opt

--> experimental options
o.shortmess:append("c")                   --> hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
o.whichwrap:append("<,>,[,],h,l")         --> keys allowed to move to the previous/next line when the beginning/end of line is reached
o.iskeyword:append({ "-" })               --> treats words with `-` as single words
o.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done
o.fillchars = { eob = " " }               --> hide ~ at the end of the buffer
o.fillchars:append("fold: ")              --> hide the fold marker
-- no messages    ",
-- vim.cmd[[set fillchars+=foldopen:⊟,foldsep:│,foldclose:⊞]]
vim.cmd [[set fillchars+=foldopen:,foldsep:│,foldclose:]]

-- vim.opt.fillchars = { foldclose = "", foldopen = "", vert = "▏", fold = " ", diff = "░", msgsep = "‾", foldsep = "▏" }
-- vim.opt.statuscolumn="%@SignCb@%s%=%T%@NumCb@%l │  %T"
-- vim.opt.statuscolumn="%@SignCb@%s%=%T%@NumCb@%l │  %T"
-- vim.opt.statuscolumn="%@SignCb@%s%=%T%@NumCb@%l ▊ %T"
-- vim.opt.statuscolumn="%s%=%T%l  │   %T"



-----------------> options for neovide --------------->
if vim.g.neovide then
    -- vim.opt.guifont = { "AestheticIosevka Nerd Font Mono", ":h10" }
    -- vim.opt.guifont = { "Comic Mono", ":h18" }
    -- vim.opt.guifont={"Victor Mono","FiraCode Nerd Font Mono","Comic Mono,FiraCode Nerd Font MonoComicMono Nerd Font, Victor Mono:h4"}
    -- vim.opt.guifont = { "VictorMono Nerd Font","CodeNewRoman Nerd Font Mono", ":h13" }
    -- vim.opt.linespace = 2.0
    -- vim.opt.guifont = { "FiraCode Nerd Font Mono", ":h14" }
    -- vim.opt.guifont = { "Iosevka Nerd Font Mono", ":h14" }
    -- vim.opt.guifont = { "CodeNewRoman Nerd Font Mono", ":h14" }

    -- vim.o.guifont = "ComicShannsMono Nerd Font Mono:h14:w-1.0" -- text below applies for VimScript
    -- vim.opt.guifont = { "ComicShannsMono Nerd Font Mono:h14:w-1:#e-subpixelantialias:#h-slight" }
    -- vim.o.guifont = "MonoLisa:h13:w-1" -- text below applies for VimScript
    -- vim.opt.guifont = { "CodeNewRoman Nerd Font:h15:w-0.6:#e-subpixelantialias:#h-slight" }
    -- vim.opt.guifont = { "CodeNewRoman Nerd Font:h15:w-0.6:#e-subpixelantialias:#h-slight" }
    -- vim.opt.guifont = { "CodeNewRoman Nerd Font:h15" }
    -- vim.opt.guifont = { "JetBrainsMono Nerd Font:h12" }

    vim.opt.guifont = { "Maple Mono NF:h14:w-0.6" }
    -- vim.opt.linespace = 1.0

    -- vim.g.neovide_transparency = 0.96
    -- vim.g.neovide_floating_blur_amount_x = 2.0
    -- vim.g.neovide_floating_blur_amount_y = 2.0
    vim.g.neovide_confirm_quit = false
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_cursor_animate_command_line = true
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_smooth_blink = true

    vim.g.neovide_underline_stroke_scale = 0.5
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_position_animation_length = 0.55

    vim.g.neovide_floating_shadow = false
    vim.g.neovide_floating_z_height = 4
    vim.g.neovide_light_angle_degrees = 15
    vim.g.neovide_light_radius = 2
    -- vim.g.neovide_no_idle = true

    vim.g.neovide_padding_top = 4
    --> the the scale factor
    -- vim.g.neovide_scale_factor = 0.8
    local change_scale_factor = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-=>", function()
        change_scale_factor(1.10)
    end)
    vim.keymap.set("n", "<C-->", function()
        change_scale_factor(1 / 1.10)
    end)
end
