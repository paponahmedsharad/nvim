local status_ok, which_key = pcall(require, "which-key")-- {{{
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true,
		registers = false,
		spelling = { enabled = false, suggestions = 20 },
		presets = {
			operators = false,
			motions = true,
			text_objects = true,
			-- windows = true, -- default bindings on <c-w>
			win = true, -- default bindings on <c-w>
			nav = false, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},

	-- key_labels = {},
	icons = { breadcrumb = "»", separator = "➜", group = "" },
	-- popup_mappings = { scroll_down = "<c-d>", scroll_up = "<c-u>" },
	keys = { scroll_down = "<c-d>", scroll_up = "<c-u>" },

	window = {
		border = "rounded",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 2, 2, 2, 2 },
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 5,
		align = "center",
	},
	-- ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	filter = true, -- enable this to hide mappings for which you didn't specify a label
	-- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
	show_help = true,
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
	-- triggers = "auto",
	-- triggers_blacklist = { i = { "j", "k" }, v = { "j", "k" } },
	triggers = { i = { "j", "k" }, v = { "j", "k" } },
}
local opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}
-- }}}

-- local Symbols= "✓ ✔ ☑ ✅ ✘ ☓ ✗ ✕ ✖ ☒   󱂬 󱃖 󰡱   󱝆 󱣘     󰌷      󱓨  󰓂  󰌕 󱇫  󱕘 =     󱃕   󰉦 󰓫  󱘎   󱑤 󰗼    󰙨 󰚰    󱘣  "
--──────────────────── MAPPINGS ────────────────────────
local mappings = {
	["e"] = { "<cmd>Neotree toggle<CR>", "Explorer" },
  -- ["w"] = { "<cmd>silent! w<CR>", "Save" ,
	["a"] = { "<cmd>tabnew<CR>", "New Tab" },
	["c"] = { "<cmd>close<CR>", "Close Window" },
	["d"] = { "<cmd>bdelete!<CR>", "Close Buffer" },
	-- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	--─────────────────── Quit ─────────────────────────
	q = {
		name = "󰗼 Quit/Session",
		q = { "<cmd>qall!<CR>",                                           "Quit Nvim" },
		w = { "<cmd>wq<CR>",                                              "Save and Quit" },
		s = { "<cmd>silent SessionManager save_current_session<cr>",      "Save session" },
		l = { "<cmd>SessionManager load_last_session<cr>",                "Load last session" },
		a = { "<cmd>SessionManager load_session<cr>",                     "Load all Session" },
		c = { "<cmd>SessionManager load_current_dir_session<cr>",         "Current dir Session" },
	},

	--─────────────────── Note ─────────────────────────
	n = {
		name = " Note",
		m = { ":MindOpenMain<cr>",    "Mind main" },
		p = { ":MindOpenProject<cr>", "Mind Projects" },
		c = { ":MindClose<cr>",       "Mind Close" },
		t = { ":e /tmp/tmp-note.md<cr>",       "Tmp Note" },
	},

	--─────────────────── Lspsaga ─────────────────────────
	j = {
		name = "󱃖 Code",
		r = { "<cmd>Lspsaga rename ++project<cr>",      "rename" },
		p = { "<cmd>Lspsaga peek_definition<CR>",       "peek" },
		d = { "<cmd>Lspsaga goto_definition<CR>",       "defination" },
		a = { "<cmd>Lspsaga code_action<CR>",           "action" },
		o = { "<cmd>Lspsaga outline<CR>",               "outline" },
		t = { "<cmd>Lspsaga term_toggle<CR>",           "rename" },
		f = { "<cmd>Lspsaga lsp_finder<CR>",            "finder" },
		k = { "<cmd>Lspsaga diagnostic_jump_prev<CR>",  "D. next" },
		j = { "<cmd>Lspsaga diagnostic_jump_next<CR>",  "D. prev" },
		s = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Line diagonostics" },
		h = { "<cmd>Lspsaga hover_doc<CR>",             "Hover" },
	},

	--─────────────────── Options ──────────────────────
	o = {
		name = "󱃕 Options",
		a = { "<cmd>autocmd TextChanged,TextChangedI <buffer> silent write<CR>",       "Auto write" },
		A = { "<cmd>autocmd! TextChanged,TextChangedI <buffer><CR>",                   "Disable Auto write" },
		s = { "<cmd>set spell!<cr>",                                                   "Toggle spell" },
		b = { "<cmd>IndentBlanklineToggle<cr>",                                        "Toggle Blankline" },
		n = { "<cmd>lua vim.opt.statuscolumn = '%s'<cr>",                              "only signcolumn" },
		N = { "<cmd>set nu!<cr>",                                                      "Toggle number" },
		c = { "<cmd>set signcolumn=no<cr>",                                            "Toggle signcolumn" },
		z = { "<cmd>set signcolumn=no nu! |IndentBlanklineToggle<cr>",                 "ZenMode" },
		C = { "<cmd>Copilot disable<CR>",                                              "Disable Copilot" },
    f = { "<cmd>autocmd BufWritePre * lua vim.lsp.buf.format({async = true})<CR>", "Auto format" },
    F = { "<cmd>autocmd! BufWritePre *<CR>",                                       "Disable AutoFormat" },
    d = { "<cmd>autocmd CursorHold * Lspsaga show_line_diagnostics<CR>",           "Show Diagnostics" },
    H = { "<cmd>autocmd CursorHold * echo<CR>",                                    "Clear command line" },
    K = { "<cmd>mapclear<CR><cmd>imapclear<CR>",                                   "Clear keymaps" },
    l = { "<cmd>LspStop<CR>",                                                      "Stop Lsp" },
	},

	--───────────────── Run Code ──────────────────────
	r = {
		name = " Run",
		-- z = { ":ZenMode<cr>", "Toggle Zen Mode" },
		v = { "<cmd>TermExec size=40 cmd='bun run %' direction=vertical<cr>", "Run JS/TS vertical" },
		h = { "<cmd>TermExec size=10 cmd='bun run %' direction=horizontal<cr>", "Run JS/TS horizontal" },
		r = { "<cmd>lua require'configs.codeRuner'.run() <cr>", "Run code horizontal" },
		j = { "<cmd>lua require'ranar'.run() <cr>", "Run code horizontal" }, --TODO
		t = { "<cmd>ToggleTerm<cr>", "Toggle code runner" },
	},

	--───────────────── ZenMode ────────────────────────
	m = {
		name = " Modes",
    n = { "<cmd> TZNarrow<CR>",       "Narrow Mode"     },
    f = { "<cmd> TZFocus<CR>",        "Focus Mode"      },
    m = { "<cmd> TZMinimalist<CR>",   "Minimalist Mode" },
    a = { "<cmd> TZAtaraxis<CR>",     "Atarix Mode"     },
    c = { "<cmd> set cmdheight=0<CR>","No visible cmd_line"     },
    w = { "<cmd> set columns=120 wrap linebreak<CR>","Wrap"     },
	},
	--────────────────── telescope ────────────────────────
	f = {
		name = " Find",
		f = { "<cmd>Telescope find_files<cr>", "Find Files" },
		v = { "<cmd>botright vsplit | Telescope find_files<cr>", "Find Files vp" },
		h = { "<cmd>split | Telescope find_files<cr>", "Find Files sp" },
		g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		e = { "<cmd>Telescope file_browser path=%:p:h<CR>", "Explorer" },
		o = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
		m = { "<cmd>Telescope  media_files<cr>", "Media Files" },
		z = { "<cmd>FzfLua files<cr>", "Fzf Files" },
		c = { "<cmd>let @+=expand('%:p')<cr>", "Copy path" },
		-- a = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Harpoon add" },
		-- M = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Harpoon marks" },
	},
	--────────────────── packer ────────────────────────
	p = {
		name = "󱑤 Plugins",
		i = { "<cmd>Lazy install<cr>", "Install" },
		s = { "<cmd>Lazy sync<cr>", "Sync" },
		S = { "<cmd>Lazy clear<cr>", "Status" },
		c = { "<cmd>Lazy clean<cr>", "Clean" },
		u = { "<cmd>Lazy update<cr>", "Update" },
		p = { "<cmd>Lazy profile<cr>", "Profile" },
		l = { "<cmd>Lazy log<cr>", "Log" },
		d = { "<cmd>Lazy debug<cr>", "Debug" },
	},
	--────────────────── lsp ────────────────────────
	l = {
		name = " LSP",
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Lsp definition" },
		v = { "<cmd>botright vsplit | lua vim.lsp.buf.definition()<cr>", "Definition vp" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		R = { "<cmd>lua vim.lsp.buf.references()<cr>", "Lsp references" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		h = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Lsp Help" },
		f = { "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Lsp Format" },
		k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
		j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
	},
	--────────────────── telescope ────────────────────────
	s = {
		name = " Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>FzfLua colorschemes<cr>", "Colorscheme" },
		-- h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		v = { "<cmd>vsplit<CR>", "Vertical split" },
		h = { "<cmd>split<CR>", "Horizontal split" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
		p = { "<cmd>Telescope projects<cr>", "Projects" },
	},
	--────────────────── Terminal ────────────────────────
	t = {
		name = " Terminal",
		p = { "<cmd>TermExec cmd='python %'<cr>", "Python compile" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		t = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
		c = { "<cmd>TermExec cmd='clang % && ./a.out'<cr>", "Clang compile" },
	},
	--────────────────── Gitsigns ───────────────────────
	g = {
		name = " Git",
		g = { "<cmd>LazyGit<CR>", "Lazygit" },
		t = { "<cmd>Gitsigns detach<cr>", "Gitsigns toggle" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)


which_key.register({
  [";;"] = { "<cmd>cd %:p:h<cr>", "Change dir", silent = true, mode = "n" },
  [";e"] = { "<cmd>lua MiniFiles.open()<cr>", "open dir", silent = true, mode = "n" },
  [";q"] = { "<cmd>lua MiniFiles.close()<cr>", "close dir", silent = true, mode = "n" },
  [";f"] = { "<Cmd>Telescope frecency<CR>", "Frecency", silent = true, mode = "n" },
  -- [";a"] = { "<Cmd>lua require('harpoon.mark').add_file()<CR>", "Harpoon add", silent = true, mode = "n" },
  -- [";m"] = { "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Harpoon menu", silent = true, mode = "n" },
  [";a"] = { "<Cmd>lua require('harpoon-core.mark').add_file()<CR>", "Harpoon add", silent = true, mode = "n" },
  [";m"] = { "<Cmd>lua require('harpoon-core.ui').toggle_quick_menu()<CR>", "Harpoon menu", silent = true, mode = "n" },


  ["[h"] = { "<cmd>Lspsaga hover_doc<cr>", "Hover doc", silent = true, mode = "n" },
  ["[d"] = { "<cmd>lua require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })<cr>", "Diagnostic", silent = true, mode = "n" },
  ["[w"] = { "<cmd>Lspsaga show_workspace_diagnostics ++normal<cr>", "workspace_diagnostics", silent = true, mode = "n" },
  ["[f"] = { "<cmd>lua require('conform').format()<cr>", "Format(conform)", silent = true, mode = "n" },
})




-- ╓──────────────────────────────────────────────────────────────────────────────╖
-- ║                                Visual Mode                                   ║
-- ╙──────────────────────────────────────────────────────────────────────────────╜
which_key.register({
  ["<leader>"] = {
    c = {
      name = "+comment",mode = "v",
      c = { "<cmd>lua require('comment-box').lcbox()<cr>",                         "Left aligned Centered text",  silent = true },
      l = { "<cmd>lua require('comment-box').lbox()<cr>",                          "Left aligned Left text",      silent = true },
      s = { "<cmd>lua require('comment-box').catalog()<cr>",                       "List all Style",              silent = true },
      o = { '<cmd>lua require("comment-box").lcbox(vim.fn.input "Catalog: ")<cr>', "Comment with style:",         silent = true },
      i = { '<cmd>lua require("comment-box").line(vim.fn.input "Catalog: ")<cr>',  "Left-a. line style:",         silent = true },

      m = {
        name = "+More Options",
        a = { '<cmd>lua require("comment-box").albox(vim.fn.input "Catalog: ")<cr>', "Left aligned adapted box",        silent = true },
        c = { '<cmd>lua require("comment-box").lcbox(vim.fn.input "Catalog: ")<cr>', "Left-Centered text with style:",  silent = true },
        l = { '<cmd>lua require("comment-box").llbox(vim.fn.input "Catalog: ")<cr>', "Left-Left text with style:",      silent = true },
      },
    },

    y = {
      name = "+yank",mode = {"v","n"},
      a = { '<cmd>norm "ay<cr>',                                                    "Yank to register a",  silent = true },
      p = { '<cmd>norm "ap<cr>',                                                    "Yank to register a",  silent = true },
    },
  },
})
-- keymap("n", "<Leader>bl", require("comment-box").cline, {})
