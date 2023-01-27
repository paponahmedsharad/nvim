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

local group = vim.api.nvim_create_augroup("css Snippets", { clear = true })
local file_pattern = "*.css"

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

	table.insert(target_table, snippet)
end

------------------------>   Start Refactoring ----------------------------->

cs("ifonts", {
	t({ "/*------------------Import Fonts ------------------*/", "" }),
	t({
		"/* @import url('https://fonts.googleapis.com/css2?family=Andika&display=swap'); */",
		"/* font-family: 'Andika', sans-serif; */",
		"/* @import url('https://fonts.googleapis.com/css2?family=Dosis:wght@300;400&display=swap'); */",
		"/* font-family: 'Dosis', sans-serif; */",
		"/* @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap'); */",
		"/* font-family: 'Montserrat', sans-serif; */",
		"/* @import url('https://fonts.googleapis.com/css2?family=PT+Sans&display=swap'); */",
		"/* font-family: 'PT Sans', sans-serif; */",
		"/* @import url('https://fonts.googleapis.com/css2?family=PT+Sans+Narrow&display=swap'); */",
		"/* font-family: 'PT Sans Narrow', sans-serif; */",
		"/* @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@300&display=swap'); */",
		"/* font-family: 'Nunito', sans-serif; */",
	}),
})

cs("bo", { -- [CMD] multiline vim.cmd{{{
	t({ "body {" }),
	t({ "", "  " }),
	i(1, ""),
	t({ "", "" }),
	t({ "}" }),
}) --}}}

-- auto generate body when type bo<space>
local auto = s("ccc", {
	t({ "display: flex; justify-content: center; align-items: center;" }),
	t({ "", "" }),
	i(1, ""),
})
table.insert(autosnippets, auto)

cs("not", { --
	t({ "nth-of-type(" }),
	i(1, "1"),
	t({ ") {", "  " }),
	i(2, ""),
	t({ "", "}" }),
})

cs("me", { --> media query
	t({ "@media (min-width: " }),
	i(1, "740px"),
	t({ ") {", "  " }),
	i(2, ".section "),
	t({ "{", "    " }),
	i(3, ""),
	t({ "", "  }" }),
	t({ "", "}" }),
})

cs("reset", {
	t({
		"* { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif; } html { color-scheme: dark light; } body { min-height: 100vh; background: linear-gradient(260deg, #b75d62, #754d4f); }",
		"",
		"",
	}),
	t(""),
})

cs("box-shadow", {
	t({ "box-shadow: 0 4px 12px 0 rgba(11, 18, 15, 0.97);", "" }),
})

cs("bs", {
	t({ "box-shadow: 0 4px 12px 0 rgba(11, 18, 15, 0.97);", "" }),
})

return snippets, autosnippets
