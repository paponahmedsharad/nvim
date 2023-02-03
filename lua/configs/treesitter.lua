local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end

configs.setup({
	ensure_installed = { "lua", "html", "css", "python", "fish", "json", "markdown", "javascript" },
	ignore_install = { "java" },
	sync_install = false,

	highlight = {
		enable = true, --> false will disable the whole extension
		disable = { "css" },
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = false, disable = { "python", "css" } },

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
