local ls = require("luasnip") --{{{
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("html Snippets", { clear = true })
local file_pattern = "*.html"

local function cs(trigger, nodes, opts) --{{{
	local snippet = s(trigger, nodes)
	local target_table = snippets

	local pattern = file_pattern
	local keymaps = {}

	if opts ~= nil then
		-- check for custom pattern
		if opts.pattern then
			pattern = opts.pattern
		end

		-- if opts is a string
		if type(opts) == "string" then
			if opts == "auto" then
				target_table = autosnippets
			else
				table.insert(keymaps, { "i", opts })
			end
		end

		-- if opts is a table
		if opts ~= nil and type(opts) == "table" then
			for _, keymap in ipairs(opts) do
				if type(keymap) == "string" then
					table.insert(keymaps, { "i", keymap })
				else
					table.insert(keymaps, keymap)
				end
			end
		end

		-- set autocmd for each keymap
		if opts ~= "auto" then
			for _, keymap in ipairs(keymaps) do
				vim.api.nvim_create_autocmd("BufEnter", {
					pattern = pattern,
					group = group,
					callback = function()
						vim.keymap.set(keymap[1], keymap[2], function()
							ls.snip_expand(snippet)
						end, { noremap = true, silent = true, buffer = true })
					end,
				})
			end
		end
	end

	table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- Start Refactoring --

cs("CMD", { -- [CMD] multiline vim.cmd{{{
	t({ "vim.cmd[[", "  " }),
	i(1, ""),
	t({ "", "]]" }),
}) --}}}

cs("class", {
	t({ 'class="' }),
	i(1, ""),
	t({ '"' }),
})

cs("c", {
	t({ 'class="' }),
	i(1, ""),
	t({ '"' }),
})

cs("id", {
	t({ 'id="' }),
	i(1, ""),
	t({ '"' }),
})

cs("ht", {
	t({ "<!DOCTYPE html>", "" }),
	t({ '<html lang="en">' }),
	t({ "", "" }),
	t({ "", "" }),
	t({ "<head>", "" }),
	t({ "  <title>" }),
	i(1, ""),
	t({ "</title>", "" }),
	t({ '  <meta charset="UTF-8">', "" }),
	t({ '  <meta name="viewport" content="width=device-width, initial-scale=1">', "" }),
	t({ '  <link href="css/style.css" rel="stylesheet">', "" }),
	t({ "</head>", "" }),
	t({ "<body>", "" }),
	t({ "", "  " }),
	i(2, ""),
	t({ " ", "" }),
	t({ " ", "" }),
	t({ "</body>", "" }),
	t({ "</html>" }),
})

local myauto = s("ht5", {
	t({ "<!DOCTYPE html>", "" }),
	t({ '<html lang="en">' }),
	t({ "", "" }),
	t({ "", "" }),
	t({ "<head>", "" }),
	t({ "  <title>" }),
	i(1, ""),
	t({ "</title>", "" }),
	t({ '  <meta charset="UTF-8">', "" }),
	t({ '  <meta name="viewport" content="width=device-width, initial-scale=1">', "" }),
	-- t({ '  <link href="css/style.css" rel="stylesheet">', "" }),
	t({ "<!----------- CSS/Import ------------>", "" }),
	t({ '<link href="style.css" rel="stylesheet">', "" }),
	t({ "</head>", "" }),
	t({ "<body>", "" }),
	t({ "", "  " }),
	i(2, ""),
	t({ " ", "" }),
	t({ " ", "" }),
	t({ "<!----------- Javascript ------------>", "" }),
	t({ '<script src="main.js"></script>', "" }),
	t({ "</body>", "" }),
	t({ "</html>" }),
}) --}}}
table.insert(autosnippets, myauto)

-- End Refactoring --

return snippets, autosnippets
