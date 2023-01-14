local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

mason.setup({
	ui = {
		icons = {
			package_pending = " ",
			package_installed = " ",
			package_uninstalled = " ﮊ",
		},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "v",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
			cancel_installation = "<C-c>",
		},
	},
})

-----------> install server -------------->
require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "pyright" },
	automatic_installation = false,
})
