--─────────────────────── Install Lazy ──────────────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

--─────────────────────── P L U G I N S ─────────────────────────────
require("lazy").setup({
	--> Colorscheme
	{ "tanvirtin/monokai.nvim" },
	{ "lunarvim/Colorschemes" },
	{ "lunarvim/tokyonight.nvim", -- "folke/tokyonight.nvim",
		lazy = false,                                       --> load this during startup
		priority = 1000,                                    --> load this before all the other start plugins
		config = function()
			-- vim.cmd([[colorscheme tokyonight-night]])
		end,
	},

	--> Looks and feels
	{ "akinsho/nvim-bufferline.lua" },                    --> Bufferline/tabline(top bar)
	{ "nvim-lualine/lualine.nvim" },                      --> Status Line (bottom bar)
	{ "kyazdani42/nvim-web-devicons" },                   --> Icon set (bufferline dependency)
	{ "nvim-lua/plenary.nvim" },                          --> dependency for many plugins

	--> Telescope/search
	{ "nvim-telescope/telescope.nvim" },                  --> Search file/dir
	{ "nvim-telescope/telescope-file-browser.nvim" },     --> another file manager
	{ "nvim-telescope/telescope-fzf-native.nvim" },
	{ "nvim-telescope/telescope-frecency.nvim" },         --> shows frequently use files
	{ "nvim-telescope/telescope-media-files.nvim" },
	{ "kkharji/sqlite.lua" },                             --> Require For Telescope-frecency
	{ "ibhagwan/fzf-lua" },                               --> fuzzy finder
  { "ThePrimeagen/harpoon" },                           --> kind of bookmarker for me
	{ "Shatur/neovim-session-manager" },                  --> session manager
	{ "nvim-telescope/telescope-ui-select.nvim", event = "VeryLazy" },
	{ "phaazon/hop.nvim", branch = "v2", config = function() require("hop").setup({ keys = "etovxqpdygfblzhckisuran" }) end, },

	--> Feature
	{ "nvim-neo-tree/neo-tree.nvim" },                    --> file browser
	-- { "MunifTanjim/nui.nvim" },                        --> required for neotree(UI Component Library for Neovim)
	{ "folke/which-key.nvim" },                           --> Popup keymaps
	{ "numToStr/Comment.nvim", event = "VeryLazy" },      --> Toggle Comment
	{ "akinsho/toggleterm.nvim" },                        --> Terminal inside nvim
	{ "nvim-treesitter/nvim-treesitter" },                --> Syntax Hightlight
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ "p00f/nvim-ts-rainbow", event = "VeryLazy" },       --> Parenthesis highlighting
	{ "folke/twilight.nvim", event = "VeryLazy" },        --> Foucs
	{ "windwp/nvim-autopairs" },                          --> Autopairs
	{ "nvim-lua/popup.nvim" },                            --> Popup api
	{ "uga-rosa/ccc.nvim", event = "VeryLazy" },          --> Color picker
	{ "frabjous/knap" },                                  --> Auto-Previewer for latex
	{ "mg979/vim-visual-multi", event = "VeryLazy" },     --> Malti selection
	{ "norcalli/nvim-colorizer.lua", event = "VeryLazy" },--> Color Hightlight(rgb, hex etc)
	{ "lukas-reineke/indent-blankline.nvim", event = "VeryLazy" }, --> Indentation
	{ "lewis6991/gitsigns.nvim", event = "VeryLazy", config = function() require("gitsigns").setup() end, },

	---> LSP
	{ "neovim/nvim-lspconfig" },                          --> Nvim Lsp
	{ "williamboman/mason.nvim" },                        --> Lsp server installer
	{ "williamboman/mason-lspconfig.nvim", lazy = true }, --> Connect mason with nvim lsp
	{ "hrsh7th/nvim-cmp" },                               --> Auto completion engine
	{ "hrsh7th/cmp-cmdline" },                            --> AutoCompletion from command
	{ "hrsh7th/cmp-buffer", event = "VeryLazy" },         --> AutoCompletion from buffer
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-nvim-lsp" },                           --> LSP AutoCompletion
	{ "L3MON4D3/LuaSnip", event = "VeryLazy" },           --> Snippets engine
	{ "saadparwaiz1/cmp_luasnip" },                       --> luasnip completion source f
	{ "rafamadriz/friendly-snippets" },                   --> Some snippets #TODO

	--> formatter
	{ "lukas-reineke/lsp-format.nvim" },                  --> Formmat support from lsp server
	{ "mhartington/formatter.nvim" },                     --> File Formatter engine
	{ "MunifTanjim/prettier.nvim" },                      --> Formatter

	--> ChatGPT
	{
		"jackMort/ChatGPT.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},

	--> Less important plugin
	{ "elkowar/yuck.vim", event = "VeryLazy" },            --> Syntax hightlight for ex.yuck file
	{ "rcarriga/nvim-notify" },

	--> Testing stage
	{ "kdheepak/lazygit.nvim" },
	{
		"phaazon/mind.nvim",
		event = "VeryLazy",
		branch = "v2.2",
		config = function()
			require("mind").setup()
		end,
	},

	-- { dir = "~/repo/Colorschemes" },
	-- { dir = "~/repo/melange" },

--───────────────────────── E N D ──────────────────────────────────
})
