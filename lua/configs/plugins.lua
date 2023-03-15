--+ Lazy {{{
--─────────────────── I N S T A L L   L A Z Y ───────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

--─────────────────────── P L U G I N S ─────────────────────────────
require("lazy").setup({
-- }}}
  ----------------------------------------------------------------------------------------------------------------------------
	--> Looks and feels
  ----------------------------------------------------------------------------------------------------------------------------
	{
		"paponahmedsharad/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			require("bluloco").setup({
				italics = true,
			})
			vim.cmd.colorscheme("bluloco")
		end,
	},
	{ "folke/tokyonight.nvim" },
	{ "nanozuki/tabby.nvim", event = "VeryLazy" },                                        --> tabline != bufferline
	{ "kyazdani42/nvim-web-devicons" },                                                   --> Icon set (bufferline dependency)
	{ "nvim-lua/plenary.nvim" },                                                          --> dependency for many plugins
	{ "nvim-lualine/lualine.nvim", enabled = false },                                     --> Status Line (bottom bar)

  ----------------------------------------------------------------------------------------------------------------------------
	--> Telescope/search
  ----------------------------------------------------------------------------------------------------------------------------
	{ "nvim-telescope/telescope.nvim" },                                                  --> Search file/dir
	{ "nvim-telescope/telescope-file-browser.nvim" },                                     --> another file manager
	{ "nvim-telescope/telescope-fzf-native.nvim" },                                       --> fuzzy finder
	{ "nvim-telescope/telescope-frecency.nvim" },                                         --> shows frequently use files
	{ "nvim-telescope/telescope-media-files.nvim" },                                      --> file browser
	{ "nvim-telescope/telescope-ui-select.nvim", event = "VeryLazy" },                    --> ui select
	{ "kkharji/sqlite.lua" },                                                             --> Require For Telescope-frecency
	{ "ThePrimeagen/harpoon" },                                                           --> kind of bookmarker for me
	{ "ibhagwan/fzf-lua", event = "VeryLazy" },                                           --> fuzzy finder
	{
		"Shatur/neovim-session-manager",                                                    --> session manager
    event = "VeryLazy",
		config = function()
			require("session_manager").setup({
				autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
				autosave_last_session = false,
			})
		end,
	},

  ----------------------------------------------------------------------------------------------------------------------------
  --> features
  ----------------------------------------------------------------------------------------------------------------------------
	{ "nvim-neo-tree/neo-tree.nvim" },                                                    --> file browser
	{ "MunifTanjim/nui.nvim" },                                                           --> required for neotree(UI Component Library for Neovim)
	{ "ggandor/leap.nvim", event = { "BufReadPre", "BufNewFile"}},                        --> better /search/motion
	{ "folke/which-key.nvim" },                                                           --> Popup keymaps
	{ "numToStr/Comment.nvim", event = { "BufReadPre", "BufNewFile"}},                    --> Toggle Comment
	{ "akinsho/toggleterm.nvim" },                                                        --> Terminal inside nvim
	{ "p00f/nvim-ts-rainbow", event = "VeryLazy" },                                       --> Parenthesis highlighting
	{ "Tummetott/reticle.nvim", event = "BufEnter", config = true },                      --> enable cursorline only for focused win
	{ "frabjous/knap", event = "VeryLazy" },                                              --> Auto-Previewer for latex
	{ "norcalli/nvim-colorizer.lua", event = { "BufReadPre", "BufNewFile" }},             --> Color Highlight(rgb, hex etc)
	{ "lewis6991/gitsigns.nvim", event = { "BufReadPre", "BufNewFile", config = true } }, --> Shows git sign on left side
	{ "ziontee113/color-picker.nvim", event = "VeryLazy", config = true },                --> color picker
  --+ Note-taking/ lazygit/ treesitter / mini* {{{
	{                                                                                     --> neorg/notetaking
		"nvim-neorg/neorg",
		ft = "norg",
		opts = {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
				["core.norg.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/.notes",
						},
					},
				},
			},
		},
	},

	--> Note taking
	{
		"phaazon/mind.nvim",
		event = "VeryLazy",
		branch = "v2.2",
		config = function()
			require("mind").setup()
		end,
	},

	--> lazygit
	{
		"kdheepak/lazygit.nvim",
		config = function()
			vim.cmd([[let g:lazygit_floating_window_scaling_factor = 1.0]])
		end,
	},

	--> treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
	},

	--> mini surround
	{
		"echasnovski/mini.surround",
    event = { "BufReadPre", "BufNewFile"},
		version = false,
		config = function()
			require("mini.surround").setup()
		end,
		-- event = "VeryLazy",
	},

	--> mini autoPairs
	{
		"echasnovski/mini.pairs",
		version = false,
		event = "InsertEnter",
		config = function()
			require("mini.pairs").setup({
				-- disable_filetype = { 'TelescopePrompt' },
				-- disable_keymap = true,
			})
		end,
	},

  --> enhances builtin-text-objects
	{
		"echasnovski/mini.ai",
		event = "InsertEnter",
		config = function()
			require("mini.ai").setup()
		end,
	},

	--> indent guides for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			char = "▏",
			-- char = "│",
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
	},

	--> active indent guide and indent text objects
	{
		"echasnovski/mini.indentscope",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			symbol = "│", -- symbol = "▏",
			options = { try_as_border = true },
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "neo-tree", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup(opts)
		end,
	},
 -- }}}

  ----------------------------------------------------------------------------------------------------------------------------
  --> Code/LSP/CMP/Formmat
  ----------------------------------------------------------------------------------------------------------------------------
	-- { "lukas-reineke/lsp-format.nvim", event = "VeryLazy" },           --> Formmat support from lsp server
	{ "neovim/nvim-lspconfig", event = { "BufReadPost", "BufNewFile" } }, --> Nvim Lsp
	{ "williamboman/mason.nvim", event = "VeryLazy" },                    --> Lsp server installer
	{ "williamboman/mason-lspconfig.nvim", lazy = true },                 --> Connect mason with nvim lsp
	{ "hrsh7th/cmp-nvim-lsp" },                                           --> LSP AutoCompletion
	{ "hrsh7th/cmp-buffer", event = "VeryLazy" },                         --> AutoCompletion from buffer
	{ "hrsh7th/cmp-path", event = "InsertEnter" },                        --> AutoCompletion fot path
	{ "hrsh7th/cmp-cmdline", event = "VeryLazy" },                        --> AutoCompletion from command
	{ "hrsh7th/nvim-cmp", event = "InsertEnter" },                        --> Auto completion engine
	{ "dcampos/cmp-emmet-vim", ft = { "html", "css" }},                   --> Emmet for html and css
	{ "mattn/emmet-vim", ft = { "html", "css" }},                         --> Emmet for html and css
	{ "jose-elias-alvarez/null-ls.nvim" },                                --> formatter
	{
		"dcampos/nvim-snippy",                                              --> Snippets engine
		event = "InsertEnter",
		dependencies = {
			"dcampos/cmp-snippy",
			"honza/vim-snippets",
		},
		config = function()
			require("snippy").setup({
				mappings = {
					is = {
						["<A-j>"] = "expand_or_advance",
						["<A-k>"] = "previous",
					},
				},
			})
		end,
	},

	--> Lspsaga
	{
		"glepnir/lspsaga.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("lspsaga").setup({
				symbol_in_winbar = {
					enable = false,
				},
				diagnostic = {
					on_insert = false,
				},
			})
		end,
	},

	--> copilot
	{
		"github/copilot.vim",
		event = "InsertEnter",
		cmd = { "Copilot" },
		init = function()
			vim.cmd([[imap <silent><script><expr> <M-Space> copilot#Accept("")]])
		end,
	},

	--> ChatGPT
	{
		"jackMort/ChatGPT.nvim",
		event = "BufWinEnter",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},

  ----------------------------------------------------------------------------------------------------------------------------
  --> Testing
  ----------------------------------------------------------------------------------------------------------------------------
	{ "nvim-treesitter/playground", enabled = false },                                           --> syntax highlighting
	{ "godlygeek/tabular", event = "VeryLazy", enabled = false },                                --> indent based on char
  {
    "loctvl842/monokai-pro.nvim",
      config = function()
        require("monokai-pro").setup()
      end,
    enabled = false
  },
  --> pretty fold
  {
   'anuvyklack/pretty-fold.nvim',
   config = function()
      require('pretty-fold').setup({
        sections = {
           left = {
              'content', ' ─────────❭❱ ( ', 'number_of_folded_lines', ', ', 'percentage', ' )'
           },
           right = { ' ' }
        },
        fill_char = ' ',
        remove_fold_markers = true,
        })
   end
  }
	-- { dir = "~/onecolor.nvim" },
	--───────────────────────── E N D ──────────────────────────────────
})
