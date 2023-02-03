--> CONTENTS (press alt+m to toggle)
--> some custom config

local options = {
	ttyfast = true,
	termguicolors = true,
	guifont = { "AestheticIosevka Nerd Font Mono", ":h11" },
	clipboard = "unnamedplus", --> system clipboard
	backup = false, -- creates a backup file
	number = true, --> shows number
	relativenumber = false, --> relative number style
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	-- showtabline = 2, -- always show tabs
	smarttab = true,
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	shortmess = "IqcFWoOcT",
	hidden = true, --> required to keep multiple buffers and open multiple buffers
	cursorline = true, --> show cursorline
	swapfile = false, --> no swap
	hlsearch = true, --> highlight search
	incsearch = true,
	ignorecase = true, --> ignorecase in search
	smartcase = true,
	-- undofile = true, --> enable persistent undo
	mouse = "nv", --> mouse only for normal and visual mode
	matchpairs = "(:),{:},[:]",

	scrolloff = 4,
	sidescrolloff = 2,
	updatetime = 300, --> faster completion (4000ms default)
	timeoutlen = 150, --> time to wait for a mapped sequence to complete (in milliseconds)

	wrap = false, --> display lines as one long line
	whichwrap = "b,s,<,>,[,],h,l",
	pumheight = 10, --> item show in popup window,
	fileencoding = "utf-8",
	cmdheight = 0, --> height below status line
	splitbelow = true,

	-- copyindent = true,
	smartindent = true,
	autoindent = true,
	expandtab = true, -- convert tabs to spaces
	tabstop = 2, -- insert 2 spaces for a tab
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	-- softtabstop = 4,

	--> new options
	completeopt = { "menuone", "noselect" },
	laststatus = 3, -- Global Status
	formatoptions = "crqnbj",
	-- set.conceallevel = 2
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

--> some custom config
-- vim.cmd [[ set iskeyword+=-,.]] --> use this for change change/delete text connected by -,.

--> Disable various builtin plugins that bog down speed
vim.did_load_filetypes = 0
vim.do_filetype_lua = 1
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

--> testing-stage
vim.opt.shortmess:append("c") -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
vim.opt.whichwrap:append("<,>,[,],h,l") -- keys allowed to move to the previous/next line when the beginning/end of line is reached
vim.opt.iskeyword:append("-") -- treats words with `-` as single words
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done
vim.opt.fillchars = { eob = " " }
