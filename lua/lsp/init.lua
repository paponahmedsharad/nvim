local lspconfig = require("lspconfig")
require("lsp.mason")
require("lsp.handlers").setup()

----------------------------------------------------------->
local servers = { "sumneko_lua", "tsserver" }
for _, lsp in pairs(servers) do
	local opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}

	if lsp == "sumneko_lua" then
		local sumneko_opts = require("lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	lspconfig[lsp].setup(opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

---------------------------------------------------->
lspconfig.tsserver.setup({
	on_attach = require("lsp.handlers").on_attach,
	capabilities = require("lsp.handlers").capabilities,
	filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
	root_dir = function()
		return vim.loop.cwd()
	end,
})

---------------------------------------------------->
lspconfig.cssls.setup({
	on_attach = require("lsp.handlers").on_attach,
	capabilities = require("lsp.handlers").capabilities,
	filetypes = { "css", "scss", "less" },
	root_dir = function()
		return vim.loop.cwd()
	end,
})

---------------------------------------------------->
lspconfig.cssls.setup({
	on_attach = require("lsp.handlers").on_attach,
	capabilities = require("lsp.handlers").capabilities,
	filetypes = { "css", "scss", "less" },
	root_dir = function()
		return vim.loop.cwd()
	end,
})

-----------------> emmet_ls ------------------------->
lspconfig.emmet_ls.setup({
	on_attach = require("lsp.handlers").on_attach,
	capabilities = require("lsp.handlers").capabilities,
	-- on_attach = on_attach,
	-- capabilities = capabilities,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})

-------------------> quick_lint_js -------------------------->
local configs = require("lspconfig/configs")
if not lspconfig.quick_lint_js then
	configs.quick_lint_js = {
		default_config = {
			cmd = { "quick-lint-js", "--lsp-server" },
			filetypes = { "javascript" },
			root_dir = function(fname)
				return lspconfig.util.find_node_modules_ancestor(fname)
					or lspconfig.util.find_git_ancestor(fname)
					or vim.loop.os_homedir()
			end,
			settings = {},
		},
	}
end
lspconfig.quick_lint_js.setup({})
