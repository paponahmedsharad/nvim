local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

--> setup
treesitter.setup {
  ensure_installed = { --> A list of parser names, or "all"
    "lua",
    "html",
    "css",
    "python",
    "fish",
    -- "help",
    "json",
    "markdown",
    "javascript",
    "c",
  },
  autopairs = {
    enable = true,
  },

  sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
  auto_install = true, -- Automatically install missing parsers when entering buffer
  ignore_install = { "java" }, -- List of parsers to ignore installing (for "all")

  highlight = {
    enable = true, -- `false` will disable the whole extension
    disable = { "java", "help" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = false, --> this may slow down the edditor
  },
  indent = { enable = false },

  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp", "html" }, --list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 300, -- Do not enable for files with more than n lines, int
    -- termcolors = {} -- table of colour name strings
  },
}
