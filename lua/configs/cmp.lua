local ok, cmp = pcall(require, "cmp")
if not ok then
	return
end

-- for <Tab>
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end
--[[ local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end ]]

--> border color
-- vim.cmd("highlight! BorderBG                    guibg=NONE guifg=#004d80")
vim.cmd("highlight! BorderBG                    guibg=NONE guifg=#50518e")
-- vim.cmd("highlight! Pmenu                       guibg=#383e4a  guifg=#000000")
vim.cmd("highlight! PmenuSel                    guibg=#3e4554  guifg=NONE")
vim.cmd("highlight! PmenuThumb                  ctermbg=Black  guibg=#24273f")

--> cmp-menu colors
vim.api.nvim_set_hl(0, "CmpItemMenu",           { fg = "#43427d", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindVariable",   { fg = "#4d4db3", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction",   { fg = "#4d6666", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet",    { fg = "#099700", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindText",       { fg = "#0a5300", bg = "NONE" })

--───────────────────────── cmp-setup ─────────────────────────────
cmp.setup({
  -- performance={fetching_timeout=50};
	completion = {
	  completeopt = "menu,menuone,noinsert",
	},
 snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
	-- 		require("snippy").expand_snippet(args.body)
      end
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
    ['<Tab>'] = function(fallback) if not cmp.select_next_item() then if vim.bo.buftype ~= 'prompt' and has_words_before() then cmp.complete() else fallback() end end end,
  },
-- local M = {}
-- M.icons = { Class = " ", Color = " ", Constant = " ", Constructor = " ", Enum = "了 ", EnumMember = " ", Field = " ", File = " ", Folder = " ", Function = " ", Interface = "ﰮ ", Keyword = " ", Method = "ƒ ", Module = " ", Property = " ", Snippet = "﬌ ", Struct = " ", Text = " ", Unit = " ", Value = " ", Variable = " ", }
-- function M.setup()
--   local kinds = vim.lsp.protocol.CompletionItemKind
--   for i, kind in ipairs(kinds) do
--     kinds[i] = M.icons[kind] or kind
--   end
-- end

-- return M
	formatting = {
		fields = { "abbr", "menu",  "kind" },
		format = function(entry, vim_item)
			-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- Kind icons
			vim_item.menu = ({
        -- icons 💡🔆⌘
				nvim_lsp = " ﰮ",
				snippy = " ",
				luasnip = " ",
				vim_snippets = " ",
        emmet_vim = " ",
        -- emmet_vim = " ",
				buffer = " ",
				path = " ",
			})[entry.source.name]
			return vim_item
		end,
	},

-- ╭──────────────────────────────────────────────────────────╮
-- │ Sources                                                  │
-- ╰──────────────────────────────────────────────────────────╯
	sources = {
		-- { name = "copilot",},
    { name = 'luasnip', option = { show_autosnippets = true },keyword_length = 1 },
		{ name = "nvim_lsp", keyword_length = 1 },
		-- { name = "luasnip" , keyword_length = 1},
		-- { name = "snippy" , keyword_length = 1},
		{ name = "vim_snippets" },
    -- { name = "emmet_vim"},
    { name = "buffer", keyword_length=2 },
		-- { name = "path" },
	},

	--> CONFIGURATION FOR SPECIFIC FILETYPE.
	cmp.setup.filetype({ "css" }, {
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			-- { name = "snippy" },
			{ name = "luasnip" },
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
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
	experimental = {
		ghost_text = true,
    -- ghost_text = {hl_group = 'Comment'}
	},
    performance = {
    max_view_entries = 100,
  }
})
