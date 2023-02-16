--─────────────────── I N S T A L L   L A Z Y ───────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

--─────────────────────── P L U G I N S ─────────────────────────────
require("lazy").setup({
	--> Colorscheme
	{
    dir = "~/repo/bluloco.new",
		-- "paponahmedsharad/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			require("bluloco").setup({
				style = "dark",
				transparent = false,
				italics = true,
				-- terminal = vim.fn.has("gui_running") == 1,                 --> bluoco colors are enabled in gui terminals per default.
			})
			vim.cmd([[colorscheme bluloco]])
		end,
	},
	{ "folke/tokyonight.nvim", },

	--> Looks and feels
  { 'nanozuki/tabby.nvim', event = "VeryLazy"},                    --> tabline != bufferline
	{ "nvim-lualine/lualine.nvim" },                                 --> Status Line (bottom bar)
	{ "kyazdani42/nvim-web-devicons" },                              --> Icon set (bufferline dependency)
	{ "nvim-lua/plenary.nvim" },                                     --> dependency for many plugins

	--> Telescope/search
	{ "nvim-telescope/telescope.nvim" },                             --> Search file/dir
	{ "nvim-telescope/telescope-file-browser.nvim" },                --> another file manager
	{ "nvim-telescope/telescope-fzf-native.nvim" },                  --> fuzzy finder
	{ "nvim-telescope/telescope-frecency.nvim" },                    --> shows frequently use files
	{ "nvim-telescope/telescope-media-files.nvim" },                 --> file browser
	{ "nvim-telescope/telescope-ui-select.nvim", event = "VeryLazy" },
	{ "kkharji/sqlite.lua" },                                        --> Require For Telescope-frecency
  { "ThePrimeagen/harpoon" },                                      --> kind of bookmarker for me
	{ "ibhagwan/fzf-lua", config = true, event="VeryLazy" },         --> fuzzy finder
	{ "Shatur/neovim-session-manager",                               --> session manager
		config = function()
			require("session_manager").setup({
        autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
        autosave_last_session = false,
			})
		end,
  },

	--> Feature
	-- { "MunifTanjim/nui.nvim" },                                   --> required for neotree(UI Component Library for Neovim)
	{ "nvim-neo-tree/neo-tree.nvim" },                               --> file browser
	{ "ggandor/leap.nvim"},                                          --> better /search/motion
	{ "folke/which-key.nvim" },                                      --> Popup keymaps
	{ "numToStr/Comment.nvim", event = "VeryLazy" },                 --> Toggle Comment
	{ "akinsho/toggleterm.nvim" },                                   --> Terminal inside nvim
	{ "nvim-treesitter/nvim-treesitter" },                           --> Syntax Highlight
	{ "p00f/nvim-ts-rainbow", event = "VeryLazy" },                  --> Parenthesis highlighting
	{ "folke/twilight.nvim", event = "VeryLazy" },                   --> Foucs
	{ "windwp/nvim-autopairs", config= true },                       --> Autopairs
	{ "nvim-lua/popup.nvim" },                                       --> Popup api
	-- { "uga-rosa/ccc.nvim", config= true, event = "VeryLazy" },       --> Color picker
	{ "frabjous/knap", event = "VeryLazy" },                         --> Auto-Previewer for latex
	-- { "mg979/vim-visual-multi", event = "VeryLazy" },                --> Multi selection
	{ "norcalli/nvim-colorizer.lua", event = "VeryLazy"},            --> Color Highlight(rgb, hex etc)
	{ "lewis6991/gitsigns.nvim", config = true, event = "VeryLazy"}, --> Shows git sign on left side
	{ "kdheepak/lazygit.nvim", config = function() vim.cmd[[let g:lazygit_floating_window_scaling_factor = 1.0]] end, },
  { 'echasnovski/mini.surround', version = false, config= function () require('mini.surround').setup() end, event = "VeryLazy"},
	{ "lukas-reineke/indent-blankline.nvim", config = function() require'colorizer'.setup() end, event = "VeryLazy" },   --> Indentation

	--> formatter
	{ "lukas-reineke/lsp-format.nvim", event = "VeryLazy" },         --> Formmat support from lsp server
	{ "mhartington/formatter.nvim", event = "VeryLazy" },            --> File Formatter engine
	{ "MunifTanjim/prettier.nvim", event = "VeryLazy" },             --> Formatter

	---> LSP/CMP
	{ "neovim/nvim-lspconfig", event = "VeryLazy" },                 --> Nvim Lsp
	{ "williamboman/mason.nvim", event = "VeryLazy" },               --> Lsp server installer
	{ "williamboman/mason-lspconfig.nvim", lazy = true },            --> Connect mason with nvim lsp
	{ "hrsh7th/cmp-nvim-lsp" },                                      --> LSP AutoCompletion
	{ "hrsh7th/cmp-buffer", event = "VeryLazy" },                    --> AutoCompletion from buffer
	{ "hrsh7th/cmp-path" },                                          --> AutoCompletion fot path
	{ "hrsh7th/cmp-cmdline" },                                       --> AutoCompletion from command
	{ "hrsh7th/nvim-cmp" },                                          --> Auto completion engine
  { 'dcampos/cmp-emmet-vim' },
  { "mattn/emmet-vim", event = "VeryLazy", },                      --> Emmet for html and css
	{	"dcampos/nvim-snippy",                                         --> Snippets engine
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

	--> ChatGPT
	{
		"jackMort/ChatGPT.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},

	--> Testing stage
	{
		"phaazon/mind.nvim",
		event = "VeryLazy",
		branch = "v2.2",
		config = function()
			require("mind").setup()
		end,
	},
  { "Tummetott/reticle.nvim", config= true }, --> enable cursorline only for focused win
  { "github/copilot.vim"},
  -- { "zbirenbaum/copilot.lua" },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function ()
  --     require("copilot_cmp").setup({
  --        method = "getCompletionsCycling",
  --     })
  --   end
  -- }

  {
      "glepnir/lspsaga.nvim",
      config = function()
          require("lspsaga").setup({
            symbol_in_winbar = {
              enable = false,
            },
          })
      end,
  },
  {"ziontee113/color-picker.nvim",
  event = "VeryLazy",
      config = function()
          require("color-picker")
      end,
  }
--───────────────────────── E N D ──────────────────────────────────
})
