local ok, cmp = pcall(require, "cmp")
if not ok then
	return
end

--[[ local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end ]]

--> border color
-- vim.cmd("highlight! BorderBG                    guibg=NONE guifg=#004d80")
vim.cmd("highlight! BorderBG                    guibg=NONE guifg=#2c2d38")
vim.cmd("highlight! PmenuSel                    guibg=#272a43  guifg=NONE")
vim.cmd("highlight! PmenuThumb                  ctermbg=Black guibg=#24273f")
--> cmp-menu colors
vim.api.nvim_set_hl(0, "CmpItemMenu",           { fg = "#43427d", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindVariable",   { fg = "#4d4db3", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction",   { fg = "#4d6666", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet",    { fg = "#099700", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindText",       { fg = "#0a5300", bg = "NONE" })

--───────────────────────── cmp-setup ─────────────────────────────
cmp.setup({
	completion = {
	  completeopt = "menu,menuone,noinsert",
	},
	snippet = {
		expand = function(args)
			require("snippy").expand_snippet(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
		}),
		documentation = cmp.config.window.bordered({
			winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
		}),
	},

	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		-- ["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-Space>"] = cmp.mapping.confirm({ select = true }),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
		-- ["<Tab>"] = cmp.mapping(function(fallback) if cmp.visible() then cmp.select_next_item() elseif check_backspace() then fallback() else fallback() end end, { "i", "s" }),
  },

	formatting = {
		fields = { "abbr", "menu",  "kind" },
		format = function(entry, vim_item)
			-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- Kind icons
			vim_item.menu = ({
        -- icons 💡🔆
				nvim_lsp = " ",
				snippy = " ",
				vim_snippets = " ",
        emmet_vim = " ",
				buffer = " ",
				path = " ",
			})[entry.source.name]
			return vim_item
		end,
	},

	sources = {
		-- { name = "copilot",},
		{ name = "nvim_lsp", keyword_length = 1 },
		{ name = "snippy" , keyword_length = 1},
		{ name = "vim_snippets" },
    { name = "emmet_vim"},
    { name = "buffer" },
		{ name = "path" },
	},

	--> CONFIGURATION FOR SPECIFIC FILETYPE.
	cmp.setup.filetype({ "css" }, {
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "snippy" },
			{ name = "emmet_vim" },
			{ name = "vim-snippets" },
		}, {
			{ name = "buffer" },
		}),
	}),

	--> CMP FOR SEARCH
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	}),

	--> CMP FOR CMDLINE
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	}),

	experimental = {
		ghost_text = false,
	},
})
