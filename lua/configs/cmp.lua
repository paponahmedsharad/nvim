local ok, cmp = pcall(require, "cmp")
if not ok then return
end

--> icons for cmp-menu
local kind_icons = { Text = "", Method = "m", Function = "", Constructor = "", Field = "", Variable = "", Class = "", Interface = "", Module = "", Property = "", Unit = "", Value = "", Enum = "", Keyword = "", Snippet = "", Color = "", File = "", Reference = "", Folder = "", EnumMember = "", Constant = "", Struct = "", Event = "", Operator = "", TypeParameter = "", }

--───────────────────────── cmp-setup ─────────────────────────────
cmp.setup({
	snippet = {
		expand = function(args)
			-- luasnip.lsp_expand(args.body) -- For `luasnip` users.
			require("snippy").expand_snippet(args.body)
		end,
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close(), }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- Kind icons
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				snippy = "[Snippy]",
				vim_snippets = "[VSnippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "snippy" },
		{ name = "vim-snippets" },
    -- { name = 'emmet_vim' },
		{ name = "buffer" },
		{ name = "path" },
	},

	--> configuration for specific filetype.
	-- cmp.setup.filetype({"html",}, {
	-- 	sources = cmp.config.sources({
	-- 		{ name = "snippy" },
	-- 		{ name = "vim-snippets" },
 --      { name = 'emmet_vim' },
	-- 	}, {
	-- 		{ name = "buffer" },
	-- 	}),
	-- }),

  --> Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	}),

	--> Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	}),

	experimental = {
		ghost_text = true,
		-- entries = true,
	},
})
