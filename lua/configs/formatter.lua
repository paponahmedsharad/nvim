local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
	return
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
formatter.setup({
	logging = false, --> Enable or disable logging
	log_level = vim.log.levels.WARN, --> All formatter configurations are opt-in

	filetype = {
		--> lua
		lua = {
			require("formatter.filetypes.lua").stylua, -- "formatter.filetypes.lua" defines default configurations for the
		},

		--> html
		html = {
			function()
				return {
					exe = "prettierd",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		},

		--> css
		css = {
			function()
				return {
					exe = "prettierd",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		},

		--> javascript
		javascript = {
			function()
				return {
					exe = "prettierd",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		},

		--> python
		python = {
			function()
				return {
					exe = "yapf",
					-- exe = "black",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		},

		--> "formatter.filetypes.any" defines default configurations for any filetype
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
