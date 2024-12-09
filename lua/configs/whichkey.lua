local wk = require("which-key")

wk.add({
    mode = { "n" },


    { "<leader>e",          "<cmd>Neotree toggle<CR>",                                            desc = "Explorer" },
    { "<leader>a",          "<cmd>tabnew<CR>",                                                    desc = "New Tab" },
    { "<leader>d",          "<cmd>bdelete!<CR>",                                                  desc = "Delete Buffer" },
    -- { "<leader>c",          "<cmd>close<CR>",                                                     desc = "Close Window" },


    -- Quit/Session
    { "<leader>q",  group = "󰗼 Quit/Session" },
    { "<leader>qq", "<cmd>qall!<CR>",                                                                desc = "Quit Nvim" },
    { "<leader>qw", "<cmd>wq<CR>",                                                                   desc = "Save and Quit" },
    { "<leader>qs", "<cmd>silent SessionManager save_current_session<cr>",                           desc = "Save session" },
    { "<leader>ql", "<cmd>SessionManager load_last_session<cr>",                                     desc = "Load last session" },
    { "<leader>qa", "<cmd>SessionManager load_session<cr>",                                          desc = "Load all Session" },
    { "<leader>qc", "<cmd>SessionManager load_current_dir_session<cr>",                              desc = "Current dir Session" },


    -- telescope
    { "<leader>f",  group = " Find" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>",                                                 desc = "Find Files" },
    { "<leader>fv", "<cmd>botright vsplit | Telescope find_files<cr>",                               desc = "Find Files vp" },
    { "<leader>fh", "<cmd>split | Telescope find_files<cr>",                                         desc = "Find Files sp" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",                                                  desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",                                                    desc = "Buffers" },
    { "<leader>fe", "<cmd>Telescope file_browser path=%:p:h<CR>",                                    desc = "Explorer" },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>",                                                   desc = "Recent Files" },
    { "<leader>fm", "<cmd>Telescope  media_files<cr>",                                               desc = "Media Files" },
    { "<leader>fz", "<cmd>FzfLua files<cr>",                                                         desc = "Fzf Files" },
    { "<leader>fc", "<cmd>let @+=expand('%:p')<cr>",                                                 desc = "Copy path" },


    -- LSP
    { "<leader>l",  group = " LSP" }, -- group
    { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>",                                         desc = "Lsp definition" },
    { "<leader>lv", "<cmd>botright vsplit | lua vim.lsp.buf.definition()<cr>",                       desc = "Definition vp" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                                             desc = "Rename" },
    { "<leader>lR", "<cmd>lua vim.lsp.buf.references()<cr>",                                         desc = "Lsp references" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",                                        desc = "Code Action" },
    { "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<cr>",                                     desc = "Lsp Help" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>",                               desc = "Lsp Format" },
    { "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",                                   desc = "Prev Diagnostic" },
    { "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",                                   desc = "Next Diagnostic" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",                                           desc = "CodeLens Action" },
    { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>",                                 desc = "Quickfix" },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",                              desc = "Workspace Symbols" },


    -- LSPsaga
    { "<leader>j",  group = "󱃖 LSP-saga" }, -- group
	{ "<leader>jr", "<cmd>Lspsaga rename ++project<cr>",      desc="rename" },
	{ "<leader>jp", "<cmd>Lspsaga peek_definition<CR>",       desc="peek" },
	{ "<leader>jd", "<cmd>Lspsaga goto_definition<CR>",       desc="defination" },
	{ "<leader>ja", "<cmd>Lspsaga code_action<CR>",           desc="action" },
	{ "<leader>jo", "<cmd>Lspsaga outline<CR>",               desc="outline" },
	{ "<leader>jt", "<cmd>Lspsaga term_toggle<CR>",           desc="rename" },
	{ "<leader>jf", "<cmd>Lspsaga lsp_finder<CR>",            desc="finder" },
	{ "<leader>jk", "<cmd>Lspsaga diagnostic_jump_prev<CR>",  desc="D. next" },
	{ "<leader>jj", "<cmd>Lspsaga diagnostic_jump_next<CR>",  desc="D. prev" },
	{ "<leader>js", "<cmd>Lspsaga show_line_diagnostics<CR>", desc="Line diagonostics" },
	{ "<leader>jh", "<cmd>Lspsaga hover_doc<CR>",             desc="Hover" },


    { "<leader>o",  group = "󱃕 Options" }, -- group
    { "<leader>oa", "<cmd>autocmd TextChanged,TextChangedI <buffer> silent write<CR>",       desc="Auto write" },
	{ "<leader>oA", "<cmd>autocmd! TextChanged,TextChangedI <buffer><CR>",                   desc="Disable Auto write" },
	{ "<leader>os", "<cmd>set spell!<cr>",                                                   desc="Toggle spell" },
	{ "<leader>ob", "<cmd>IndentBlanklineToggle<cr>",                                        desc="Toggle Blankline" },
	{ "<leader>on", "<cmd>lua vim.opt.statuscolumn = '%s'<cr>",                              desc="only signcolumn" },
	{ "<leader>oN", "<cmd>set nu!<cr>",                                                      desc="Toggle number" },
	{ "<leader>oc", "<cmd>set signcolumn=no<cr>",                                            desc="Toggle signcolumn" },
	{ "<leader>oz", "<cmd>set signcolumn=no nu! |IndentBlanklineToggle<cr>",                 desc="ZenMode" },
	{ "<leader>oC", "<cmd>Copilot disable<CR>",                                              desc="Disable Copilot" },
    { "<leader>of", "<cmd>autocmd BufWritePre * lua vim.lsp.buf.format({async = true})<CR>", desc="Auto format" },
    { "<leader>oF", "<cmd>autocmd! BufWritePre *<CR>",                                       desc="Disable AutoFormat" },
    { "<leader>od", "<cmd>autocmd CursorHold * Lspsaga show_line_diagnostics<CR>",           desc="Show Diagnostics" },
    { "<leader>oH", "<cmd>autocmd CursorHold * echo<CR>",                                    desc="Clear command line" },
    { "<leader>oK", "<cmd>mapclear<CR><cmd>imapclear<CR>",                                   desc="Clear keymaps" },
    { "<leader>ol", "<cmd>LspStop<CR>",                                                      desc="Stop Lsp" },

    --
    { ";;", "<cmd>cd %:p:h<cr>",                                                             desc = "Change dir" },
    { ";e", "<cmd>lua MiniFiles.open()<cr>",                                                 desc = "open dir",           silent = true, mode = "n" },
    { ";q", "<cmd>lua MiniFiles.close()<cr>",                                                desc = "close dir",          silent = true, mode = "n" },
    { ";f", "<Cmd>Telescope frecency<CR>",                                                   desc = "Frecency",           silent = true, mode = "n" },
    { ";a", "<Cmd>lua require('harpoon-core.mark').add_file()<CR>",                          desc = "Harpoon add",        silent = true, mode = "n" },
    { ";m", "<Cmd>lua require('harpoon-core.ui').toggle_quick_menu()<CR>",                   desc = "Harpoon menu",       silent = true, mode = "n" },
    { ";f", "<cmd>lua require('conform').format()<cr>",                                      desc = "Format(conform)" },
    { ";i", "<cmd>BufferLinePick<cr>",                                                       desc = "Pick Buffer" },
	{ ";t", ":e /tmp/tmp-note.md<cr>",       desc="Tmp Note" },

    --
    { "[h", "<cmd>Lspsaga hover_doc<cr>",                                                    desc = "Hover doc" },
    { "[w", "<cmd>Lspsaga show_workspace_diagnostics ++normal<cr>",                          desc = "workspace_diagnostics" },
    { "[f", "<cmd>lua require('conform').format()<cr>",                                      desc = "Format(conform)" },
    { "[d", "<cmd>lua require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })<cr>", desc = "Diagnostic" },




    { "<leader>r",  group = " Run" },
    { "<leader>rv", "<cmd>TermExec size=40 cmd='bun run %' direction=vertical<cr>",    desc="Run JS/TS vertical" },
	{ "<leader>rh", "<cmd>TermExec size=10 cmd='bun run %' direction=horizontal<cr>",  desc="Run JS/TS horizontal" },
	{ "<leader>rr", "<cmd>lua require'configs.codeRuner'.run() <cr>",                  desc="Run code horizontal" },
	{ "<leader>rj", "<cmd>lua require'ranar'.run() <cr>",                              desc="Run code horizontal" }, --TODO
	{ "<leader>rt", "<cmd>ToggleTerm<cr>",                                             desc="Toggle code runner" },

    { "<leader>m",  group = " Mode" },
    { "<leader>mn", "<cmd> TZNarrow<CR>",                       desc="Narrow Mode"     },
    { "<leader>mf", "<cmd> TZFocus<CR>",                        desc="Focus Mode"      },
    { "<leader>mm", "<cmd> TZMinimalist<CR>",                   desc="Minimalist Mode" },
    { "<leader>ma", "<cmd> TZAtaraxis<CR>",                     desc="Atarix Mode"     },
    { "<leader>mc", "<cmd> set cmdheight=0<CR>",                desc="No visible cmd_line"     },
    { "<leader>mw", "<cmd> set columns=120 wrap linebreak<CR>", desc="Wrap"     },


    { "<leader>p",  group = "󱑤 Plugins" },
    { "<leader>pi", "<cmd>Lazy install<cr>", desc="Install" },
	{ "<leader>ps", "<cmd>Lazy sync<cr>",    desc="Sync" },
	{ "<leader>pS", "<cmd>Lazy clear<cr>",   desc="Status" },
	{ "<leader>pc", "<cmd>Lazy clean<cr>",   desc="Clean" },
	{ "<leader>pu", "<cmd>Lazy update<cr>",  desc="Update" },
	{ "<leader>pp", "<cmd>Lazy profile<cr>", desc="Profile" },
	{ "<leader>pl", "<cmd>Lazy log<cr>",     desc="Log" },
	{ "<leader>pd", "<cmd>Lazy debug<cr>",   desc="Debug" },

    { "<leader>s",  group = " Serach" },
    { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc="Checkout branch" },
	{ "<leader>sc", "<cmd>FzfLua colorschemes<cr>",    desc="Colorscheme" },
	{ "<leader>sh", "<cmd>Telescope help_tags<cr>",    desc="Find Help" },
	{ "<leader>sv", "<cmd>vsplit<CR>",                 desc="Vertical split" },
	{ "<leader>sh", "<cmd>split<CR>",                  desc="Horizontal split" },
	{ "<leader>sM", "<cmd>Telescope man_pages<cr>",    desc="Man Pages" },
	{ "<leader>sR", "<cmd>Telescope registers<cr>",    desc="Registers" },
	{ "<leader>sk", "<cmd>Telescope keymaps<cr>",      desc="Keymaps" },
	{ "<leader>sC", "<cmd>Telescope commands<cr>",     desc="Commands" },
	{ "<leader>sp", "<cmd>Telescope projects<cr>",     desc="Projects" },



    { "<leader>t",  group = " Terminal" },
    { "<leader>tp", "<cmd>TermExec cmd='python %'<cr>",    desc="Python compile" },
	{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc="Float" },
	{ "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc="Float" },
	{ "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc="Horizontal" },
	{ "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>",   desc="Vertical" },
	{ "<leader>tc", "<cmd>TermExec cmd='clang % && ./a.out'<cr>",       desc="Clang compile" },

})

wk.add({
    mode = { "v" },
     { "<leader>",  group = "Comment"},
     { "<leader>c", "<cmd>lua require('comment-box').lcbox()<cr>",                         desc="Left aligned Centered text",  silent = true },
     { "<leader>l", "<cmd>lua require('comment-box').lbox()<cr>",                          desc="Left aligned Left text",      silent = true },
     { "<leader>s", "<cmd>lua require('comment-box').catalog()<cr>",                       desc="List all Style",              silent = true },
     { "<leader>o", '<cmd>lua require("comment-box").lcbox(vim.fn.input "Catalog: ")<cr>', desc="Comment with style:",         silent = true },
     { "<leader>i", '<cmd>lua require("comment-box").line(vim.fn.input "Catalog: ")<cr>',  desc="Left-a. line style:",         silent = true },

     { "<leader>m",  group = "More options"},
     { "<leader>ma", '<cmd>lua require("comment-box").albox(vim.fn.input "Catalog: ")<cr>', desc="Left aligned adapted box",        silent = true },
     { "<leader>mc", '<cmd>lua require("comment-box").lcbox(vim.fn.input "Catalog: ")<cr>', desc="Left-Centered text with style:",  silent = true },
     { "<leader>ml", '<cmd>lua require("comment-box").llbox(vim.fn.input "Catalog: ")<cr>', desc="Left-Left text with style:",      silent = true },
})

-- local status_ok, which_key = pcall(require, "which-key")-- {{{
-- if not status_ok then
-- 	return
-- end

-- local setup = {
-- 	plugins = {
-- 		marks = true,
-- 		registers = false,
-- 		spelling = { enabled = false, suggestions = 20 },
-- 		presets = {
-- 			operators = false,
-- 			motions = true,
-- 			text_objects = true,
-- 			-- windows = true, -- default bindings on <c-w>
-- 			win = true, -- default bindings on <c-w>
-- 			nav = false, -- misc bindings to work with windows
-- 			z = true, -- bindings for folds, spelling and others prefixed with z
-- 			g = true, -- bindings for prefixed with g
-- 		},
-- 	},

-- 	-- key_labels = {},
-- 	icons = { breadcrumb = "»", separator = "➜", group = "" },
-- 	-- popup_mappings = { scroll_down = "<c-d>", scroll_up = "<c-u>" },
-- 	keys = { scroll_down = "<c-d>", scroll_up = "<c-u>" },

-- 	window = {
-- 		border = "rounded",
-- 		position = "bottom",
-- 		margin = { 1, 0, 1, 0 },
-- 		padding = { 2, 2, 2, 2 },
-- 		winblend = 0,
-- 	},
-- 	layout = {
-- 		height = { min = 4, max = 25 },
-- 		width = { min = 20, max = 50 },
-- 		spacing = 5,
-- 		align = "center",
-- 	},
-- 	-- ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
-- 	filter = true, -- enable this to hide mappings for which you didn't specify a label
-- 	-- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
-- 	show_help = true,
--   show_keys = true, -- show the currently pressed key and its label as a message in the command line
-- 	-- triggers = "auto",
-- 	-- triggers_blacklist = { i = { "j", "k" }, v = { "j", "k" } },
-- 	triggers = { i = { "j", "k" }, v = { "j", "k" } },
-- }
-- local opts = {
-- 	mode = "n",
-- 	prefix = "<leader>",
-- 	buffer = nil,
-- 	silent = true,
-- 	noremap = true,
-- 	nowait = true,
-- }
-- -- }}}

-- -- local Symbols= "✓ ✔ ☑ ✅ ✘ ☓ ✗ ✕ ✖ ☒   󱂬 󱃖 󰡱   󱝆 󱣘     󰌷      󱓨  󰓂  󰌕 󱇫  󱕘 =     󱃕   󰉦 󰓫  󱘎   󱑤 󰗼    󰙨 󰚰    󱘣  "
-- --──────────────────── MAPPINGS ────────────────────────

-- 	--─────────────────── Note ─────────────────────────

-- 	--─────────────────── Lspsaga ─────────────────────────

-- 	--─────────────────── Options ──────────────────────
-- 	o = {
-- 	},

-- 	--───────────────── Run Code ──────────────────────
-- 	r = {
-- 	},

-- 	--───────────────── ZenMode ────────────────────────
-- 	m = {
-- 	},
-- 	--────────────────── telescope ────────────────────────
-- 	f = {
-- 	},
-- 	--────────────────── packer ────────────────────────
-- 	p = {
-- 	},
-- 	--────────────────── lsp ────────────────────────
-- 	l = {
-- 		name = " LSP",
-- 		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Lsp definition" },
-- 		v = { "<cmd>botright vsplit | lua vim.lsp.buf.definition()<cr>", "Definition vp" },
-- 		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
-- 		R = { "<cmd>lua vim.lsp.buf.references()<cr>", "Lsp references" },
-- 		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
-- 		h = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Lsp Help" },
-- 		f = { "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Lsp Format" },
-- 		k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
-- 		j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
-- 		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
-- 		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
-- 		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
-- 	},
-- 	--────────────────── telescope ────────────────────────
-- 	s = {
-- 	},
-- 	--────────────────── Terminal ────────────────────────
-- 	t = {
-- 	},
-- 	--────────────────── Gitsigns ───────────────────────
-- 	g = {
-- 		name = " Git",
-- 		g = { "<cmd>LazyGit<CR>", "Lazygit" },
-- 		t = { "<cmd>Gitsigns detach<cr>", "Gitsigns toggle" },
-- 		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
-- 		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
-- 		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
-- 		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
-- 		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
-- 		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
-- 		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
-- 		u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
-- 		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
-- 		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
-- 		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
-- 		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
-- 	},
-- }

-- which_key.setup(setup)
-- which_key.register(mappings, opts)


-- which_key.register({
--   [";;"] = { "<cmd>cd %:p:h<cr>", "Change dir", silent = true, mode = "n" },
--   [";e"] = { "<cmd>lua MiniFiles.open()<cr>", "open dir", silent = true, mode = "n" },
--   [";q"] = { "<cmd>lua MiniFiles.close()<cr>", "close dir", silent = true, mode = "n" },
--   [";f"] = { "<Cmd>Telescope frecency<CR>", "Frecency", silent = true, mode = "n" },
--   -- [";a"] = { "<Cmd>lua require('harpoon.mark').add_file()<CR>", "Harpoon add", silent = true, mode = "n" },
--   -- [";m"] = { "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Harpoon menu", silent = true, mode = "n" },
--   [";a"] = { "<Cmd>lua require('harpoon-core.mark').add_file()<CR>", "Harpoon add", silent = true, mode = "n" },
--   [";m"] = { "<Cmd>lua require('harpoon-core.ui').toggle_quick_menu()<CR>", "Harpoon menu", silent = true, mode = "n" },


--   ["[h"] = { "<cmd>Lspsaga hover_doc<cr>", "Hover doc", silent = true, mode = "n" },
--   ["[d"] = { "<cmd>lua require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })<cr>", "Diagnostic", silent = true, mode = "n" },
--   ["[w"] = { "<cmd>Lspsaga show_workspace_diagnostics ++normal<cr>", "workspace_diagnostics", silent = true, mode = "n" },
--   ["[f"] = { "<cmd>lua require('conform').format()<cr>", "Format(conform)", silent = true, mode = "n" },
-- })




-- -- ╓──────────────────────────────────────────────────────────────────────────────╖
-- -- ║                                Visual Mode                                   ║
-- -- ╙──────────────────────────────────────────────────────────────────────────────╜
-- which_key.register({
--   ["<leader>"] = {
--     c = {
--       name = "+comment",mode = "v",
--       c = { "<cmd>lua require('comment-box').lcbox()<cr>",                         "Left aligned Centered text",  silent = true },
--       l = { "<cmd>lua require('comment-box').lbox()<cr>",                          "Left aligned Left text",      silent = true },
--       s = { "<cmd>lua require('comment-box').catalog()<cr>",                       "List all Style",              silent = true },
--       o = { '<cmd>lua require("comment-box").lcbox(vim.fn.input "Catalog: ")<cr>', "Comment with style:",         silent = true },
--       i = { '<cmd>lua require("comment-box").line(vim.fn.input "Catalog: ")<cr>',  "Left-a. line style:",         silent = true },

--       m = {
--         name = "+More Options",
--         a = { '<cmd>lua require("comment-box").albox(vim.fn.input "Catalog: ")<cr>', "Left aligned adapted box",        silent = true },
--         c = { '<cmd>lua require("comment-box").lcbox(vim.fn.input "Catalog: ")<cr>', "Left-Centered text with style:",  silent = true },
--         l = { '<cmd>lua require("comment-box").llbox(vim.fn.input "Catalog: ")<cr>', "Left-Left text with style:",      silent = true },
--       },
--     },

--     y = {
--       name = "+yank",mode = {"v","n"},
--       a = { '<cmd>norm "ay<cr>',                                                    "Yank to register a",  silent = true },
--       p = { '<cmd>norm "ap<cr>',                                                    "Yank to register a",  silent = true },
--     },
--   },
-- })
-- -- keymap("n", "<Leader>bl", require("comment-box").cline, {})
