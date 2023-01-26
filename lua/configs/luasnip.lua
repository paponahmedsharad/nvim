local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
	return
end

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
require("luasnip").config.setup({ store_selection_keys = "<A-p>" })

vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]) --}}}

----------------------> Virtual text ------------------------>
local types = require("luasnip.util.types")
ls.config.set_config({
	history = true, --keep around last snippet local to jump back
	updateevents = "TextChanged,TextChangedI", --update changes as you type
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "GruvboxOrange" } },
			},
		},
		-- [types.insertNode] = {
		-- 	active = {
		-- 		virt_text = { { "●", "GruvboxBlue" } },
		-- 	},
		-- },
	},
})

----------------------> Keymap -------------------------->
vim.keymap.set({ "i", "s" }, "<c-u>", '<cmd>lua require("luasnip.extras.select_choice")()<cr><C-c><C-c>')

--> expend/maximize if available
vim.keymap.set({ "i", "s" }, "<a-m>", function()
	if ls.expand_or_jumpable() then
		ls.expand()
	end
end, { silent = true })

--> jump snippets variable forword (alt+j)
vim.keymap.set({ "i", "s" }, "<A-j>", function()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end, { silent = true })
--> with jj
vim.keymap.set({ "i", "s" }, "jj", function()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end, { silent = true })

--> jump snippets variable backword (alt+k)
vim.keymap.set({ "i", "s" }, "<A-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })
--> with kk
vim.keymap.set({ "i", "s" }, "kk", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

--> choice backword
vim.keymap.set({ "i", "s" }, "<a-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

--> choice forword
vim.keymap.set({ "i", "s" }, "<a-h>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end)

--> other settings
vim.cmd([[autocmd BufEnter */snippets/*.lua nnoremap <silent> <buffer> <CR> /-- End Refactoring --<CR>O<Esc>O]])
