local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

--> setup
indent_blankline.setup {
  enabled = true,
  filetype_exclude = {
    "help",
    "startify",
    "packer",
    "Trouble",
    "text",
  },
  char = "▏",
  -- char_highlight_list = {
  --   "IndentBlanklineIndent1",
  --   "IndentBlanklineIndent2",
  --   "IndentBlanklineIndent3",
  --   "IndentBlanklineIndent4",
  --   "IndentBlanklineIndent5",
  --   "IndentBlanklineIndent6",
  -- },
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  use_treesitter = true,
  show_current_context = true,
  show_current_context_start = true,
}

-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#00334d gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#003f6e gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#20546e gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56546e gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#005180 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
