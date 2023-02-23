local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
  return
end

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
  show_trailing_blankline_indent = false,
  -- show_first_indent_level = true,
  -- use_treesitter = true,
  show_current_context = true,
  show_current_context_start = true,
}
