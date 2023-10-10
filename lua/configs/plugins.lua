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
	  -- dir = "~/repo/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			require("bluloco").setup({
				italics = false,
			})
			vim.cmd.colorscheme("bluloco")
		end,
	},
	{ "folke/tokyonight.nvim" },                                                         -- Tokyonight colorscheme
	{                                                                                    -- Syntex highlight
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
	},
	{ "nanozuki/tabby.nvim", event = "VeryLazy" },                                        --> tabline != bufferline
	{ "kyazdani42/nvim-web-devicons" },                                                   --> Icon set (bufferline dependency)
	{ "nvim-lua/plenary.nvim" },                                                          --> dependency for many plugins
	{ "nvim-lualine/lualine.nvim", enabled = false },                                     --> Status Line (bottom bar)

  -- A fancy buffer viewer
  {
    "tomiis4/BufferTabs.nvim",
    lazy = false,
    opts = {
      border = "rounded",
      padding = 1,
      icons = true,
      -- hl_group = "Keyword",
      hl_group = "#ff1a00",
      hl_group_inactive = "Comment",
      ---@type table[]
      exclude = {},
      show_all = false,
      display = "column", ---@type 'row'|'column'
      horizontal = "right", ---@type 'left'|'right'|'center'
      vertical = "top", ---@type 'top'|'bottom'|'center'
    }
  },

  --> pretty fold
  {
    "anuvyklack/pretty-fold.nvim",
    config = function()
      require("pretty-fold").setup({
        sections = {
          left = {
            "content",
            "... ─────────❭❱ ( ",
            "number_of_folded_lines",
            ", ",
            "percentage",
            " )",
          },
          right = { " " },
        },
        fill_char = " ",
        remove_fold_markers = true,
      })
    end,
  },

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

  -- A light version of harpoon
  {
    'MeanderingProgrammer/harpoon-core.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('harpoon-core').setup({
        use_existing = true, -- Make existing window active rather than creating a new window
        mark_branch = false, -- Set marks specific to each git branch inside git repository
        use_cursor = true, -- Use the previous cursor position of marked files when opened
        menu = {
          width = 100,
          height = 20,
        },
        -- Highlight groups to use for various components
        highlight_groups = {
          window = 'HarpoonWindow',
          border = 'HarpoonBorder',
        },
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
	-- { "Tummetott/reticle.nvim", event = "BufEnter", config = true },                      --> enable cursorline only for focused win
	-- { "frabjous/knap", event = "VeryLazy" },                                              --> Auto-Previewer for latex
	{ "norcalli/nvim-colorizer.lua", event = { "BufReadPre", "BufNewFile" }},             --> Color Highlight(rgb, hex etc)
	{ "lewis6991/gitsigns.nvim", event = { "BufReadPre", "BufNewFile", config = true } }, --> Shows git sign on left side
	{ "ziontee113/color-picker.nvim", event = "BufReadPost", config = true },                --> color picker
	{ "uga-rosa/ccc.nvim", event = "BufReadPost", config = true },                --> color picker
  -- Shift window with hjkl
  { "sindrets/winshift.nvim" },
  -- Autopair
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6",
    opts = {},
  },


  --+ Note-taking/ lazygit/ mini* {{{

	--> Note taking
	-- {
	-- 	"phaazon/mind.nvim",
	-- 	event = "VeryLazy",
	-- 	branch = "v2.2",
	-- 	config = function()
	-- 		require("mind").setup()
	-- 	end,
	-- },

	--> lazygit
	{
		"kdheepak/lazygit.nvim",
		config = function()
			vim.cmd([[let g:lazygit_floating_window_scaling_factor = 1.0]])
		end,
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
	-- {
	-- 	"echasnovski/mini.pairs",
	-- 	version = false,
	-- 	event = "InsertEnter",
 --    enabled=false,
	-- 	config = function()
	-- 		require("mini.pairs").setup({
	-- 			-- disable_filetype = { 'TelescopePrompt' },
	-- 			-- disable_keymap = true,
	-- 		})
	-- 	end,
	-- },

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

  ---> motion plugins
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    -- config = function()
    opts = {
      -- labels = "abcdefghijklmnopqrstuvwxyz",
      labels = "asdfghjklqwertyuiopzxcvbnm",
      modes = {
        search = {
          enabled = false, -- when `true`, flash will be activated during regular search by default.
        },
        -- options used when flash is activated through `f`, `F`, `t`, `T`, `;` and `,` motions
        char = {
          enabled = true,
          -- When using jump labels, don't use these keys This allows using those keys directly after the motion label = { exclude = "hjkliardc" },
          label = { exclude = "iar" },
          -- by default all keymaps are enabled, but you can disable some of them, by removing them from the list.
          -- If you rather use another key, you can map them to something else, e.g., { [";"] = "L", [","] = H }
          keys = { "f", "F", "t", "T", ";", "," },
          -- The direction for `prev` and `next` is determined by the motion. `left` and `right` are always left and right.
          char_actions = function(motion)
            return {
              [";"] = "next", -- set to `right` to always go right
              [","] = "prev", -- set to `left` to always go left
              -- clever-f style
              [motion:lower()] = "next",
              [motion:upper()] = "prev",
            }
          end,
          search = { wrap = false },
          highlight = { backdrop = true },
          jump = { register = false },
        },
      },
    },
    -- custom keymap
    keys = {
      { ",", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
  },



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
	{ "hrsh7th/nvim-cmp" },                                               --> Auto completion engine
	{ "dcampos/cmp-emmet-vim", ft = { "html", "css", "javascriptreact", "jsx" }},                   --> Emmet for html and css
	{ "mattn/emmet-vim", ft = { "html", "css","javascriptreact","jsx","javascript" }},                         --> Emmet for html and css
  -- Lightweight alternative of luasnip{{{
	-- {
	-- 	"dcampos/nvim-snippy",                                              --> Snippets engine
	-- 	event = "InsertEnter",
	-- 	dependencies = {
	-- 		"dcampos/cmp-snippy",
	-- 		"honza/vim-snippets",
	-- 	},
	-- 	config = function()
	-- 		require("snippy").setup({
	-- 			mappings = {
	-- 				is = {
	-- 					["<A-j>"] = "expand_or_advance",
	-- 					["<A-k>"] = "previous",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
-- }}}
	{
		"L3MON4D3/LuaSnip",
		version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		-- build = "make install_jsregexp"
	},
  { "saadparwaiz1/cmp_luasnip" },
  { "honza/vim-snippets" },
	-- { "rafamadriz/friendly-snippets" },

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
					on_insert = true,
				},
			})
		end,
	},

  -- code formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
      },
    },
  },

  -- Code runner (current map is <c-;>)
  { "CRAG666/code_runner.nvim", config = true },

  -- Not in use (Copilot, ChatGPT){{{
	--> copilot
	-- {
	-- 	"github/copilot.vim",
	-- 	-- event = "InsertEnter",
	-- 	cmd = { "Copilot" },
	-- 	init = function()
	-- 		vim.cmd([[imap <silent><script><expr> <M-Space> copilot#Accept("")]])
	-- 		vim.cmd([[ let g:copilot_filetypes = { 'markdown': v:true,  } ]])
	-- 	end,
	-- },

	--> ChatGPT
	-- {
	-- 	"jackMort/ChatGPT.nvim",
	-- 	event = "BufWinEnter",
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- },
  --}}}




	----------------------------------------------------------------------------------------------------------------------------
	--> Test Stage
	----------------------------------------------------------------------------------------------------------------------------
  { "nvim-treesitter/playground", enabled = true },            --> syntax highlighting
  { "godlygeek/tabular",          event = "VeryLazy", enabled = false }, --> indent based on char
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup()
    end,
    enabled = false,
  },

  -- Another file browser #TODO
  {
    "echasnovski/mini.files",
    version = false,
    opts = {
      mappings = {
        close       = 'q',
        go_in       = 'l',
        go_in_plus  = 'L',
        go_out      = 'h',
        go_out_plus = 'H',
        reset       = '<BS>',
        reveal_cwd  = '@',
        show_help   = 'g?',
        synchronize = '=',
        trim_left   = '<',
        trim_right  = '>',
      },
      windows = {
        -- Maximum number of windows to show side by side
        max_number = math.huge,
        -- Whether to show preview of file/directory under cursor
        preview = true,
        width_focus = 50,
        width_nofocus = 15,
        width_preview = 50,
      },
    },
  },

  -- TS helper
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
        tsserver_max_memory = "auto",
        -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
        complete_function_calls = false,
      },
    }
  },

  -- Test typing spped
  {
    "NStefan002/speedtyper.nvim",
    branch = "main",
    cmd = "Speedtyper",
    opts = {
      -- your config
      window = {
        height = 8,     -- integer >= 5 | float in range (0, 1)
        width = 0.55,   -- integer | float in range (0, 1)
        border = "rounded", -- "none" | "single" | "double" | "rounded" | "shadow" | "solid"
      },
      language = "en",  -- currently only only supports English
      game_modes = {    -- prefered settings for different game modes
        -- type until time expires
        countdown = {
          time = 30,
        },
        -- type until you complete one page
        stopwatch = {
          hide_time = true, -- hide time while typing
        },
      },
    },
  },

  -- { "Pheon-Dev/pigeon" },
  -- { dir = "~/onecolor.nvim" },
  -- { "smithbm2316/centerpad.nvim" },

  -- { import = 'custom.plugins' },
  --────────────────────────────── E N D ──────────────────────────────────
}, {})
