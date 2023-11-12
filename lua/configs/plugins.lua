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
  -- {
  --   "tomiis4/BufferTabs.nvim",
  --   lazy = false,
  --   opts = {
  --     border = "rounded",
  --     padding = 1,
  --     icons = true,
  --     -- hl_group = "Keyword",
  --     hl_group = "#ff1a00",
  --     hl_group_inactive = "Comment",
  --     ---@type table[]
  --     exclude = {},
  --     show_all = false,
  --     display = "column", ---@type 'row'|'column'
  --     horizontal = "right", ---@type 'left'|'right'|'center'
  --     vertical = "bottom", ---@type 'top'|'bottom'|'center'
  --   }
  -- },

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
			-- symbol = "│", -- symbol = "▏",
      symbol = '▏',
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

  { -- Session Manager
    "folke/persistence.nvim",

    -- event = "BufReadPre", -- this will only start session saving when an actual file was opened

    -- restore the session for the current directory
    -- keys = {
    --   {
    --     "<leader>qs",
    --     function()
    --       require("persistence").load()
    --     end,
    --     mode = "n",
    --     desc = "Save Session",
    --   },
    --   -- restore the last session
    --   {
    --     "<leader>ql",
    --     function()
    --       require("persistence").load { last = true }
    --     end,
    --     mode = "n",
    --     desc = "Restore Session",
    --   },
    --   -- stop Persistence => session won't be saved function()on exit
    --   {
    --     "<leader>qd",
    --     function()
    --       require("persistence").stop()
    --     end,
    --     desc = "Stop Session Save",
    --     mode = "n",
    --   },
    -- },

    opts = {
      -- add any custom options here
    },
  },

  { -- A Vim alignment plugin
    "junegunn/vim-easy-align",

    keys = {
      {
        "<c-g>",
        "<Plug>(EasyAlign)",
        mode = { "x", "n" },
        desc = "Easy Align",
      },
    },
  },
  { -- Perfect zen mode
    "Pocco81/true-zen.nvim",
    config = function()
       require("true-zen").setup {
       modes = { -- configurations per mode
          ataraxis = {
            shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
            backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
            minimum_writing_area = { -- minimum size of main window
              width = 80,
              height = 44,
            },
            quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
            padding = { -- padding windows
              left = 52,
              right = 52,
              top = 0,
              bottom = 0,
            },
            callbacks = { -- run functions when opening/closing Ataraxis mode
              open_pre = nil,
              open_pos = nil,
              close_pre = nil,
              close_pos = nil
            },
          },
          minimalist = {
            ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
            options = { -- options to be disabled when entering Minimalist mode
              number = true,
              relativenumber = false,
              showtabline = 0,
              signcolumn = "no",
              statusline = "",
              cmdheight = 0,
              laststatus = 0,
              showcmd = false,
              showmode = false,
              ruler = false,
              numberwidth = 6
            },
            callbacks = { -- run functions when opening/closing Minimalist mode
              open_pre = nil,
              open_pos = nil,
              close_pre = nil,
              close_pos = nil
            },
          },
          narrow = {
            --- change the style of the fold lines. Set it to:
            --- `informative`: to get nice pre-baked folds
            --- `invisible`: hide them
            --- function() end: pass a custom func with your fold lines. See :h foldtext
            folds_style = "informative",
            run_ataraxis = true, -- display narrowed text in a Ataraxis session
            callbacks = { -- run functions when opening/closing Narrow mode
              open_pre = nil,
              open_pos = nil,
              close_pre = nil,
              close_pos = nil
            },
          },
          focus = {
            callbacks = { -- run functions when opening/closing Focus mode
              open_pre = nil,
              open_pos = nil,
              close_pre = nil,
              close_pos = nil
            },
          }
        },
        integrations = {
          tmux = false, -- hide tmux status bar in (minimalist, ataraxis)
          kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
            enabled = false,
            font = "+3"
          },
          twilight = false, -- enable twilight (ataraxis)
          lualine = false -- hide nvim-lualine (ataraxis)
        },       -- your config goes here

        -- or just leave it empty :)
       }
    end,
  },

  {
    "LudoPinelli/comment-box.nvim",
    config = function(_, opts)
      require("comment-box").setup(opts)
    end,
    opts = {
      doc_width = 80, -- width of the document
      box_width = 70, -- width of the boxes
      borders = { -- symbols used to draw a box
        top = "─",
        bottom = "─",
        left = "│",
        right = "│",
        top_left = "╭",
        top_right = "╮",
        bottom_left = "╰",
        bottom_right = "╯",
      },
      line_width = 80, -- width of the lines
      line = { -- symbols used to draw a line
        line = "─",
        line_start = "─",
        line_end = "─",
      },
      outer_blank_lines = false, -- insert a blank line above and below the box
      inner_blank_lines = false, -- insert a blank line above and below the text
      line_blank_line_above = false, -- insert a blank line above the line
      line_blank_line_below = false, -- insert a blank line below the line
    },
  },

-- ╓──────────────────────────────────────────────────────────────────────────────╖
-- ║ Buffer Line                                                                  ║
-- ╙──────────────────────────────────────────────────────────────────────────────╜
  {
    "willothy/nvim-cokeline",
    config = function ()
      local colors = {
        buf_bg = '#1a1b26',
        -- active_bg = '#292d3a',
        active_bg = '#2f2f3f',
        inactive_bg = '#242835',
        active_fg = '#000000',
        inactive_fg = '#200020',
        active_icon_fg = '#000000',
      }

    require('cokeline').setup({
      default_hl = {
        fg = function(buffer) if buffer.is_focused then return  colors.active_fg else return  colors.inactive_fg end end,
        bg = function(buffer) if buffer.is_focused then return  colors.active_bg else return  colors.inactive_bg end end,
        },

      components = {
        { -- Empty text for space
          text = ' ',
          bg = colors.buf_bg,
        },

        { -- Left bracket
          text = '',
          fg = function(buffer) if buffer.is_focused then return  colors.active_bg else return  colors.inactive_bg end end,
          bg = colors.buf_bg,
        },

        -- Empty text for space
        { text = ' ' },

        { -- file icon
          text = function(buffer)
            return buffer.devicon.icon
          end,
            fg = function(buffer) if buffer.is_focused then return  colors.active_icon_fg else return colors.buf_bg end end,
        },

        -- Empty text for space
        { text = ' ' },

        { -- Buffer name
          text = function(buffer) return buffer.filename .. '  ' end,
          style = function(buffer)
            return buffer.is_focused and 'bold' or nil
          end,
        },

        { -- Close_icon
          text = ' ',
            fg = function(buffer) if buffer.is_focused then return  colors.active_fg else return  colors.buf_bg end end,
          delete_buffer_on_left_click = true,
        },

        { -- Right bracket
          text = '',
            bg = colors.buf_bg,
            fg = function(buffer) if buffer.is_focused then return  colors.active_bg else return  colors.inactive_bg end end,
        },
      },
    })
    end
  },

--  ╓──────────────────────────────────────────────────────────────────────────────╖
--  ║ StatusLine                                                                   ║
--  ╙──────────────────────────────────────────────────────────────────────────────╜
  {'glepnir/galaxyline.nvim',
    config=function()
      local gl = require('galaxyline')
      local condition = require('galaxyline.condition')
      -- local utils = require('utils')
      local tokyonight_colors = require("tokyonight.colors").setup({

      })
      local package_info_present, package = pcall(require, 'package-info')

      -- Configuration {{{1

      -- Functions {{{2
      local function u(code)
        if type(code) == 'string' then
          code = tonumber('0x' .. code)
        end
        local c = string.char
        if code <= 0x7f then
          return c(code)
        end
        local t = {}

        if code <= 0x07ff then
          t[1] = c(bit.bor(0xc0, bit.rshift(code, 6)))
          t[2] = c(bit.bor(0x80, bit.band(code, 0x3f)))
        elseif code <= 0xffff then
          t[1] = c(bit.bor(0xe0, bit.rshift(code, 12)))
          t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
          t[3] = c(bit.bor(0x80, bit.band(code, 0x3f)))
        else
          t[1] = c(bit.bor(0xf0, bit.rshift(code, 18)))
          t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 12), 0x3f)))
          t[3] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
          t[4] = c(bit.bor(0x80, bit.band(code, 0x3f)))
        end

        return table.concat(t)
      end

      local function highlight(group, fg, bg, gui)
        local cmd = string.format('highlight %s guifg=%s guibg=%s', group, fg, bg)

        if gui ~= nil then
          cmd = cmd .. ' gui=' .. gui
        end

        vim.cmd(cmd)
      end

      -- }}}2

      -- Settings {{{2
      local lineLengthWarning = 80
      local lineLengthError = 120
      local leftbracket = "" -- Curve.
      local rightbracket = "" -- Curve.
      -- local leftbracket = u 'e0b2' -- Angle filled.
      -- local rightbracket = u 'e0b0' -- Angle filled.
      -- local leftbracket = u 'e0b3' -- Angle.
      -- local rightbracket = u 'e0b1' -- Angle.
      -- }}}2

      gl.short_line_list = { 'NvimTree', 'vista', 'dbui', 'packer', 'tagbar' }
      local gls = gl.section

      local bgcolor = function()
        if 1==1 then
          return '#011627'
        else
          return nil;
        end
      end

      -- Colours, maps and icons {{{2
      local colors = {
        bg       = '#1a1b26';
        modetext = '#000000',

        giticon = '#292d3a',
        gitbg   = '#242835',
        gittext = '#000000',

        diagerror = '#F44747',
        diagwarn  = '#FF8800',
        diaghint  = '#4FC1FF',
        diaginfo  = '#FFCC66',

        -- lspicon = '#68AF00',
        lspicon = '#292d3a',
        -- lspbg   = '#304B2E',
        lspbg   = '#242835',
        -- lsptext = '#C5C5C5',
        lsptext = '#000000',

        typeicon = '#292d3a',
        -- typebg   = '#5C2C2E',
        typebg   = '#242835',
        -- typetext = '#C5C5C5',
        typetext = '#000000',
        -- #242835
        -- #292d3a

        -- statsicon = '#468633',
        statsicon = '#292d3a',
        statsbg   = '#242835',
        -- statstext = '#9b9b9b',
        statstext = '#000000',

        lineokfg        = '#000000',
        lineokbg        = '#5080A0',
        linelongerrorfg = '#FF0000',
        linelongwarnfg  = '#FFFF00',
        linelongbg      = '#5080A0',

        shortbg   = '#DCDCAA',
        shorttext = '#000000',

        shortrightbg   = '#3F3F3F',
        shortrighttext = '#7C4C4E',

        gpsbg   = '#242835',
        gpstext = '#000000',

        red     = '#D16969',
        yellow  = '#DCDCAA',
        magenta = '#D16D9E',
        green   = '#608B4E',
        orange  = '#FF8800',
        purple  = '#C586C0',
        blue    = '#569CD6',
        cyan    = '#4EC9B0',
        black   = '#000000'
      }

      local mode_map = {
        -- ['n']        = { '#569CD6', 'NORMAL' },
        ['n']        = { '#292d3a', 'NORMAL' },
        ['i']        = { '#D16969', 'INSERT' },
        ['R']        = { '#D16969', 'REPLACE' },
        ['c']        = { '#608B4E', 'COMMAND' },
        ['v']        = { '#C586C0', 'VISUAL' },
        ['V']        = { '#C586C0', 'VIS-LN' },
        --['']        = { '#C586C0', 'VIS-BLK' },
        ['s']        = { '#FF8800', 'SELECT' },
        ['S']        = { '#FF8800', 'SEL-LN' },
        ['']        = { '#DCDCAA', 'SEL-BLK' },
        ['t']        = { '#569CD6', 'TERMINAL' },
        ['Rv']       = { '#D16D69', 'VIR-REP' },
        ['rm']       = { '#FF0000', '- More -' },
        ['r']        = { '#FF0000', "- Hit-Enter -" },
        ['r?']       = { '#FF0000', "- Confirm -" },
        ['cv']       = { '#569CD6', "Vim Ex Mode" },
        ['ce']       = { '#569CD6', "Normal Ex Mode" },
        ['!']        = { '#569CD6', "Shell Running" },
        ['ic']       = { '#DCDCAA', 'Insert mode completion |compl-generic|' },
        ['no']       = { '#DCDCAA', 'Operator-pending' },
        ['nov']      = { '#DCDCAA', 'Operator-pending (forced charwise |o_v|)' },
        ['noV']      = { '#DCDCAA', 'Operator-pending (forced linewise |o_V|)' },
        ['noCTRL-V'] = { '#DCDCAA', 'Operator-pending (forced blockwise |o_CTRL-V|) CTRL-V is one character' },
        ['oCTRL-V'] = { '#DCDCAA', 'Operator-pending (forced blockwise |o_CTRL-V|) CTRL-V is one character' },
        ['niI']      = { '#DCDCAA', 'Normal using |i_CTRL-O| in |Insert-mode|' },
        ['niR']      = { '#DCDCAA', 'Normal using |i_CTRL-O| in |Replace-mode|' },
        ['niV']      = { '#DCDCAA', 'Normal using |i_CTRL-O| in |Virtual-Replace-mode|' },
        ['ix']       = { '#DCDCAA', 'Insert mode |i_CTRL-X| completion' },
        ['Rc']       = { '#DCDCAA', 'Replace mode completion |compl-generic|' },
        ['Rx']       = { '#DCDCAA', 'Replace mode |i_CTRL-X| completion' },
      }

      -- See: https://www.nerdfonts.com/cheat-sheet
      local icons = {
        vim = u 'e62b',
        dos = u 'e70f',
        unix = u 'f17c',
        mac = u 'f179',
      }
      -- }}}2

      -- Rag status function {{{2
      local function setLineWidthColours()
        local colbg = colors.statsbg
        local linebg = colors.statsbg

        if (vim.fn.col('.') > lineLengthError)
        then
          colbg = colors.linelongerrorfg
        elseif (vim.fn.col('.') > lineLengthWarning)
        then
          colbg = colors.linelongwarnfg
        end

        if (vim.fn.strwidth(vim.fn.getline('.')) > lineLengthError)
        then
          linebg = colors.linelongerrorfg
        elseif (vim.fn.strwidth(vim.fn.getline('.')) > lineLengthWarning)
        then
          linebg = colors.linelongwarnfg
        end

        highlight('LinePosHighlightStart', colbg, colors.statsbg)
        highlight('LinePosHighlightColNum', colors.statstext, colbg)
        highlight('LinePosHighlightMid', linebg, colbg)
        highlight('LineLenHighlightLenNum', colors.statstext, linebg)
        highlight('LinePosHighlightEnd', linebg, colors.statsbg)
      end

      -- }}}2

      -- }}}1

      -- Left {{{1
      gls.left = {}

      -- Edit mode {{{2
      table.insert(gls.left, {
        ViModeSpaceOnFarLeft = {
          provider = function() return "  " end,
          highlight = { colors.giticon, colors.bg }
        }
      })
      table.insert(gls.left, {
        ViModeLeft = {
          provider = function()
            highlight('ViModeHighlight', mode_map[vim.fn.mode()][1], colors.bg)
            return leftbracket
          end,
          highlight = 'ViModeHighlight'
        }
      })
      table.insert(gls.left, {
        ViModeIconAndText = {
          provider = function()
            highlight('GalaxyViMode', colors.modetext, mode_map[vim.fn.mode()][1])

            return "  " ..icons['vim'] .. " " .. mode_map[vim.fn.mode()][2]
          end,
          highlight = 'GalaxyViMode'
        }
      })
      table.insert(gls.left, {
        ViModeRight = {
          provider = function()
            return rightbracket
          end,
          separator = ' ',
          separator_highlight = 'ViModeHighlight',
          highlight = 'ViModeHighlight'
        }
      })
      -- }}}2

      -- Git info {{{2

      -- Git Branch Name {{{3
      table.insert(gls.left, {
        GitStart = {
          provider = function() return leftbracket end,
          condition = condition.check_git_workspace,
          highlight = { colors.giticon, colors.bg }
        }
      })
      table.insert(gls.left, {
        GitIcon = {
          provider = function()
            return ' '
          end,
          condition = condition.check_git_workspace,
          separator = '',
          separator_highlight = { 'NONE', colors.giticon },
          highlight = { colors.black, colors.giticon }
        }
      })
      table.insert(gls.left, {
        GitMid = {
          provider = function() return rightbracket .. ' ' end,
          condition = condition.check_git_workspace,
          highlight = { colors.giticon, colors.gitbg }
        }
      })
      table.insert(gls.left, {
        GitBranch = {
          provider = 'GitBranch',
          condition = condition.check_git_workspace,
          separator = ' ',
          separator_highlight = { 'NONE', colors.gitbg },
          highlight = { colors.gittext, colors.gitbg }
        }
      })
      -- }}}3

      -- Git Changes {{{3
      table.insert(gls.left, {
        DiffAdd = {
          provider = 'DiffAdd',
          condition = condition.check_git_workspace,
          icon = '  ',
          highlight = { colors.green, colors.gitbg }
        }
      })
      table.insert(gls.left, {
        DiffModified = {
          provider = 'DiffModified',
          condition = condition.check_git_workspace,
          icon = '  ',
          highlight = { colors.blue, colors.gitbg }
        }
      })
      table.insert(gls.left, {
        DiffRemove = {
          provider = 'DiffRemove',
          condition = condition.check_git_workspace,
          icon = '  ',
          highlight = { colors.red, colors.gitbg }
        }
      })
      table.insert(gls.left, {
        EndGit = {
          provider = function() return rightbracket end,
          condition = condition.check_git_workspace,
          separator = " ",
          separator_highlight = { colors.gitbg, colors.bg },
          highlight = { colors.gitbg, colors.bg }
        }
      })
      -- }}}3

      -- }}}2

      -- Lsp Section {{{2


      -- Diagnostics {{{3
      -- table.insert(gls.left, {
      --   DiagnosticError = {
      --     provider = 'DiagnosticError',
      --     --icon = EcoVim.icons.errorOutline,
      --     separator_highlight = { colors.gitbg, colors.bg },
      --     highlight = { colors.diagerror, colors.lspbg }
      --   }
      -- })
      -- table.insert(gls.left, {
      --   DiagnosticWarn = {
      --     provider = 'DiagnosticWarn',
      --     icon = '  ',
      --     highlight = { colors.diagwarn, colors.lspbg }
      --   }
      -- })
      -- table.insert(gls.left, {
      --   DiagnosticHint = {
      --     provider = 'DiagnosticHint',
      --     --icon = EcoVim.icons.lightbulbOutline,
      --     highlight = { colors.diaghint, colors.lspbg }
      --   }
      -- })
      -- table.insert(gls.left, {
      --   DiagnosticInfo = {
      --     provider = 'DiagnosticInfo',
      --     --icon = EcoVim.icons.infoOutline,
      --     highlight = { colors.diaginfo, colors.lspbg }
      --   }
      -- })
      -- table.insert(gls.left, {
      --   LspSectionEnd = {
      --     provider = function() return rightbracket .. " " end,
      --     highlight = { colors.lspbg, colors.bg }
      --   }
      -- })
      -- }}}3

      -- GPS {{{3
      -- table.insert(gls.left, {
      --     nvimGPS = {
      --       provider = function()
      --         return gps.get_location()
      --       end,
      --       condition = function()
      --         return gps.is_available() and #gps.get_location() > 0
      --       end,
      --       highlight = {colors.gpstext, colors.bg}
      --     }
      -- })
      -- }}}3

      -- }}}2

      -- Cursor Position Section {{{2
      table.insert(gls.left, {
        StatsSectionStart = {
          provider = function() return leftbracket end,
          highlight = { colors.statsicon, colors.bg }
        }
      })

      table.insert(gls.left, {
        StatsIcon = {
          provider = function()
            return '⅑ '
          end,
          highlight = { colors.black, colors.statsicon }
        }
      })

      table.insert(gls.left, {
        StatsMid = {
          provider = function() return rightbracket .. ' ' end,
          highlight = { colors.statsicon, colors.statsbg }
        }
      })

      table.insert(gls.left, {
        PerCent = {
          provider = 'LinePercent',
          highlight = { colors.statstext, colors.statsbg }
        }
      })
      table.insert(gls.left, {
        Icon = {
          provider = function()
            return ' '
          end,
          highlight = { colors.statstext, colors.statsbg }
        }
      })

      table.insert(gls.left, {
        VerticalPosAndSize = {
          provider = function()
            return string.format(" %s/%3i ", vim.fn.line('.'), vim.fn.line('$'))
          end,
          -- separator = '',
          -- separator_highlight = { colors.statsicon, colors.statsbg },
          highlight = { colors.statstext, colors.statsbg }
        }
      })
-- not needed{{{
      -- table.insert(gls.left, {
      --   CursorColumnStart = {
      --     provider = function()
      --       return leftbracket
      --     end,
      --     separator = ' ',
      --     separator_highlight = { colors.statsicon, colors.statsbg },
      --     highlight = 'LinePosHighlightStart'
      --   }
      -- })
      -- table.insert(gls.left, {
      --   CursorColumn = {
      --     provider = function()
      --       setLineWidthColours()
      --       return "" .. string.format("%3i", vim.fn.col('.')) .. " /"
      --     end,
      --     highlight = 'LinePosHighlightColNum'
      --   }
      -- })
      -- table.insert(gls.left, {
      --   LineLengthStart = {
      --     provider = function()
      --       return " " .. leftbracket
      --     end,
      --     highlight = 'LinePosHighlightMid'
      --   }
      -- })
      -- table.insert(gls.left, {
      --   LineLength = {
      --     provider = function()
      --       return ' ' .. string.format("%3i", string.len(vim.fn.getline('.')))
      --     end,
      --     highlight = 'LineLenHighlightLenNum'
      --   }
      -- })
      -- table.insert(gls.left, {
      --   LineLengthEnd = {
      --     provider = function()
      --       return " " .. rightbracket .. " "
      --     end,
      --     highlight = 'LinePosHighlightEnd'
      --   }
      -- })
      -- table.insert(gls.left, {
      --   TabOrSpace = {
      --     provider = function()
      --       if vim.bo.expandtab
      --       then
      --         return ' 󰄮 '
      --       else
      --         return ' 󰄱 '
      --       end
      --     end,
      --     condition = condition.hide_in_width,
      --     highlight = { colors.statsicon, colors.statsbg }
      --   }
      -- })
      -- table.insert(gls.left, {
      --   Tabstop = {
      --     provider = function()
      --       if vim.bo.expandtab
      --       then
      --         return vim.bo.shiftwidth
      --       else
      --         return vim.bo.shiftwidth
      --       end
      --     end,
      --     condition = condition.hide_in_width,
      --     highlight = { colors.statstext, colors.statsbg }
      --   }
      -- })}}}

      table.insert(gls.left, {
        StatsSpcSectionEnd = {
          provider = function() return rightbracket .. " " end,
          highlight = { colors.statsbg, colors.bg }
        }
      })
      -- }}}2
      -- }}}1

      -- Right {{{1
      gls.right = {}

      if package_info_present then
        table.insert(gls.right, {
          PackageInfoStatus = {
            provider = function()
              return package.get_status() .. " "
            end,
          },
        })
      end

      -- Lsp Client {{{3
      -- table.insert(gls.right, {
      --   LspStart = {
      --     provider = function() return leftbracket end,
      --     highlight = { colors.lspicon, colors.bg }
      --   }
      -- })
      -- table.insert(gls.right, {
      --   LspIcon = {
      --     provider = function()
      --       local name = ""
      --       if gl.lspclient ~= nil then
      --         name = gl.lspclient()
      --       end
      --       return '' .. name
      --     end,
      --     highlight = { colors.black, colors.lspicon }
      --   }
      -- })
      -- table.insert(gls.right, {
      --   LspMid = {
      --     provider = function() return rightbracket .. ' ' end,
      --     highlight = { colors.lspicon, colors.lspbg }
      --   }
      -- })
      -- table.insert(gls.right, {
      --   ShowLspClient = {
      --     provider = 'GetLspClient',
      --     highlight = { colors.statstext, colors.lspbg }
      --   }
      -- })
      -- table.insert(gls.right, {
      --   LspSpace = {
      --     provider = function() return ' ' end,
      --     highlight = { colors.lspicon, colors.lspbg }
      --   }
      -- })
      -- table.insert(gls.right, {
      --   LspSectionEnd = {
      --     provider = function() return rightbracket .. " " end,
      --     highlight = { colors.lspbg, colors.bg }
      --   }
      -- })
      -- }}}3

      -- Type {{{2
      table.insert(gls.right, {
        TypeStart = {
          provider = function() return leftbracket end,
          highlight = { colors.typeicon, colors.bg }
        }
      })
      table.insert(gls.right, {
        TypeFileFormatIcon = {
          provider = function()
            local icon = icons[vim.bo.fileformat] or ''
            return string.format(' %s', icon)
          end,
          highlight = { colors.black, colors.typeicon }
        }
      })
      table.insert(gls.right, {
        TypeMid = {
          provider = function() return rightbracket .. ' ' end,
          highlight = { colors.typeicon, colors.typebg }
        }
      })

      -- if 1==1 then
      --   table.insert(gls.right, {
      --     FileName = {
      --       provider = function()
      --         if #vim.fn.expand '%:p' == 0 then
      --           return ''
      --         end

      --         if 1==1 then
      --           local fname = vim.fn.expand('%:p')
      --           return fname:gsub(vim.fn.getcwd() .. '/', '') .. ' '
      --         end

      --         return vim.fn.expand '%:t' .. ' '
      --       end,
      --       separator_highlight = { 'NONE', colors.typebg },
      --       highlight = { colors.typetext, colors.typebg }
      --     }
      --   })
      -- end

      table.insert(gls.right, {
        FileIcon = {
          provider = 'FileIcon',
          highlight = { colors.black, colors.typebg }
        }
      })
      table.insert(gls.right, {
        BufferType = {
          provider = 'FileTypeName',
          highlight = { colors.typetext, colors.typebg }
        }
      })
      table.insert(gls.right, {
        FileSize = {
          provider = 'FileSize',
          separator = '  ',
          separator_highlight = { colors.black, colors.typebg },
          highlight = { colors.typetext, colors.typebg }
        }
      })
      table.insert(gls.right, {
        FileEncode = {
          provider = 'FileEncode',
          separator = '',
          separator_highlight = { colors.black, colors.typebg },
          highlight = { colors.typetext, colors.typebg }
        }
      })
      table.insert(gls.right, {
        TypeSectionEnd = {
          provider = function() return rightbracket end,
          highlight = { colors.typebg, colors.bg }
        }
      })
      table.insert(gls.right, {
        Space = {
          provider = function() return ' ' end,
          highlight = { colors.typebg, colors.bg }
        }
      })
      -- }}}2


      -- }}}1

      -- Left Short {{{1
      gls.short_line_left = {}

      table.insert(gls.short_line_left, {
        ShortSectionStart = {
          provider = function() return leftbracket end,
          highlight = { colors.shortbg, colors.bg }
        }
      })
      table.insert(gls.short_line_left, {
        ShortSectionSpace = {
          provider = function() return " " end, highlight = { colors.shorttext, colors.shortbg }
        }
      })
      table.insert(gls.short_line_left, {
        LeftShortName = {
          provider = 'FileTypeName',
          highlight = { colors.shorttext, colors.shortbg },
        }
      })
      table.insert(gls.short_line_left, {
        ShortSectionMid = {
          provider = function() return " " end,
          highlight = { colors.black, colors.shortbg }
        }
      })
      table.insert(gls.short_line_left, {
        LeftShortFileName = {
          provider = 'SFileName',
          condition = condition.buffer_not_empty,
          separator_highlight = { colors.shorttext, colors.shortbg },
          highlight = { colors.shorttext, colors.shortbg },
        }
      })
      table.insert(gls.short_line_left, {
        ShortSectionEnd = {
          provider = function() return rightbracket end,
          highlight = { colors.shortbg, colors.bg }
        }
      })
      -- }}}1

      -- Right Short {{{1
      gls.short_line_right = {}

      table.insert(gls.short_line_right, {
        BufferIcon = {
          provider = 'BufferIcon',
          separator_highlight = { colors.shorttext, colors.bg },
          highlight = { colors.shortrighttext, colors.bg }
        }
      })
      -- }}}1

    end,
  },
  -- { "Pheon-Dev/pigeon" },
  -- { dir = "~/onecolor.nvim" },
  -- { "smithbm2316/centerpad.nvim" },

  -- { import = 'custom.plugins' },
  --────────────────────────────── E N D ──────────────────────────────────
}, {})
