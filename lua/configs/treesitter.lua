local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
	return
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = { "lua", "html", "css", "python", "fish", "json", "markdown", "javascript" },
	ignore_install = { "java" }, -- List of parsers to ignore installing (for "all")
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = false, disable = { "python", "css" } },

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	-- rainbow = {
	-- 	enable = true,
	-- 	disable = { "jsx", "cpp", "html" }, --list of languages you want to disable the plugin for
	-- 	extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
	-- 	max_file_lines = 1000, -- Do not enable for files with more than n lines, int
	-- 	-- termcolors = {} -- table of colour name strings
	-- },
})
