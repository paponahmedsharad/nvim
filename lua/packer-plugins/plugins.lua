--────────────── INSTALL PACKER ─────────────────
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if fn.empty(fn.glob(install_path)) > 0 then
  is_bootstrap = true
  fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
  vim.cmd [[packadd packer.nvim]]
  return true
end

--───────────────────────────────────────────────
local status_ok, packer = pcall(require, "packer") --> call packer
if not status_ok then
  return
end

packer.init { --> Have packer use a popup window
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

--──────────────── PLUGINS ──────────────────────
return packer.startup(function(use)
  use "wbthomason/packer.nvim" --> Plugin manager
  use "lunarvim/tokyonight.nvim"
  -- use "folke/tokyonight.nvim" --> Colorscheme (tokyonight)
  use "~/onedarker"

  use { "akinsho/nvim-bufferline.lua", tag = "v2.*" } --> Bufferline/tabline(top bar)
  use "nvim-lualine/lualine.nvim" --> Status Line (bottom bar)
  use "kyazdani42/nvim-web-devicons" --> Icon set
  use "elkowar/yuck.vim" --> Syntax hightlight for ex.yuck file
  use "nvim-lua/plenary.nvim"
  --──────────────── utils ──────────────────
  use "akinsho/toggleterm.nvim" --> Terminal inside nvim
  use "nvim-treesitter/nvim-treesitter" --> Syntax Hightlight
  use "p00f/nvim-ts-rainbow" --> Parenthesis highlighting
  use "lukas-reineke/indent-blankline.nvim" --> Indentation
  use "folke/twilight.nvim" --> Foucs
  use "folke/which-key.nvim" --> Popup keymaps
  use "windwp/nvim-autopairs" --> Autopairs
  use "nvim-lua/popup.nvim" --> Popup api
  use "norcalli/nvim-colorizer.lua" --> Color Hightlight(rgb, hex etc)
  use "uga-rosa/ccc.nvim" --> Color picker
  use "lewis6991/impatient.nvim" --> Nvim openning speed optimizer
  use "numToStr/Comment.nvim" --> Toggle Comment
  use "declancm/cinnamon.nvim" --> Smooth scrolling
  use { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x", requires = { "MunifTanjim/nui.nvim" } } --file browser
  --───────────────── LSP ───────────────────
  use "neovim/nvim-lspconfig" --> Nvim Lsp
  use "williamboman/mason.nvim" --> Lsp server installer
  use "williamboman/mason-lspconfig.nvim" --> Connect mason with nvim lsp
  use "hrsh7th/nvim-cmp" --> Auto completion engine
  use "hrsh7th/cmp-cmdline" --> AutoCompletion from command
  use "hrsh7th/cmp-buffer" --> AutoCompletion from buffer
  use "hrsh7th/cmp-nvim-lsp" --> LSP AutoCompletion
  use "saadparwaiz1/cmp_luasnip" -->
  use "L3MON4D3/LuaSnip" --> Snippets engine
  use "rafamadriz/friendly-snippets" --> Some snippets #TODO
  use "~/unfriendly-snippets" --> Some snippets
  use "jose-elias-alvarez/null-ls.nvim" --> formatter and linter
  use "lukas-reineke/lsp-format.nvim" --> Formmat support from lsp server
  use "mhartington/formatter.nvim" --> File Formatter engine
  use "MunifTanjim/prettier.nvim" -->
  --─────────────── search ──────────────────
  use "nvim-telescope/telescope.nvim" --> Search file/dir
  use "nvim-telescope/telescope-file-browser.nvim" --> another file manager
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "nvim-telescope/telescope-media-files.nvim"
  use "kkharji/sqlite.lua" --> require for telescope-frecency
  use "nvim-telescope/telescope-frecency.nvim" --> shows frequently use files
  use "ThePrimeagen/harpoon" --> kind of bookmarker for me
  use "nvim-telescope/telescope-project.nvim"

  --> hop for searching word
  use {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  }
  use { --> config in **/lax.vim
    "savq/paq-nvim",
    "frabjous/knap",
  }
  use {
    "phaazon/mind.nvim",
    branch = "v2.2",
    config = function()
      require("mind").setup()
    end,
  }
  ----------------> testing---------------------->
  use { "ibhagwan/fzf-lua" } --> fuzzy finder
  use "kdheepak/lazygit.nvim" --> useful for git related stuff
  use "ggandor/leap.nvim" --> for move around with three keypress
  use "nyngwang/murmur.lua" -->  super fast cursor word highlighting
  use "rcarriga/nvim-notify"
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  }
  -- use {
  --   "folke/noice.nvim",
  --   config = function()
  --     require("noice").setup {}
  --   end,
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --   },
  -- }

  -- use {
  --   "folke/noice.nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require("noice").setup()
  --   end,
  --   requires = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --     "hrsh7th/nvim-cmp",
  --   },
  -- }

  --> markdown review
  use {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup {
        style = "dark",
        width = 120,
      }
    end,
  }

  --> chatgpt
  use {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup {
        -- optional configuration
      }
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  }

  -- use "manzeloth/live-server"
  use "Shatur/neovim-session-manager"
  --────────────────────────────────────────────
  --─────────────── PluginsEnd ─────────────────
  ---> sync packer
  if is_bootstrap then
    require("packer").sync()
  end

  --> Automatically source and re-compile packer whenever save this file
  local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePost", {
    command = "source <afile> | PackerCompile",
    group = packer_group,
    pattern = vim.fn.expand "$MYVIMRC",
  })
end)
