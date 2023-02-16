local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

vim.cmd([[highlight IndentBlanklineIndent1 guifg=#232229]])
--> setup
indent_blankline.setup {
	char_highlight_list = {
		"IndentBlanklineIndent1",
	},
	space_char_highlight_list = {
		"IndentBlanklineIndent1",
	},

  enabled = true,
  filetype_exclude = {
    "help",
    "startify",
    "packer",
    "Trouble",
    "text",
  },
  char = "▏",
  show_trailing_blankline_indent = false,
  -- show_first_indent_level = true,
  -- use_treesitter = true,
  show_current_context = true,
  show_current_context_start = true,
}
