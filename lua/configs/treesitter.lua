local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end

configs.setup({


      highlight = { enable = true, disable = { "css" } },
      indent = { enable = true, disable = { "python" } },
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = { "help", "bash", "fish", "vim", "html", "css", "javascript", "tsx", "typescript", "lua", "markdown", "markdown_inline", "query", "regex", },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
	-- ensure_installed = { "lua", "html", "css", "python", "fish", "json", "markdown", "javascript" },
	-- ignore_install = { "java" },
	-- sync_install = false,

	-- highlight = {
	-- 	enable = true, --> false will disable the whole extension
	-- 	disable = { "css" },
	-- },
	-- autopairs = {
	-- 	enable = true,
	-- },
	-- indent = { enable = false, disable = { "python", "css" } },

	-- context_commentstring = {
	-- 	enable = true,
	-- 	enable_autocmd = false,
	-- },
	-- rainbow = {
	-- 	enable = true,
	-- 	disable = { "jsx", "cpp", "html" }, --list of languages you want to disable the plugin for
	-- 	extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
	-- 	max_file_lines = 1000, -- Do not enable for files with more than n lines, int
	-- 	-- termcolors = {} -- table of colour name strings
	-- },
})
