require("murmur").setup {
  cursor_rgb = "#1f3040 ", -- default to '#393939'
  max_len = 80, -- maximum word-length to highlight
  -- min_len = 3,
  disable_on_lines = 1000, -- to prevent lagging on large files. Default to 2000 lines.
  exclude_filetypes = {},
  callbacks = {
    function()
      vim.cmd "doautocmd InsertEnter"
      vim.w.diag_shown = false
    end,
  },
}
