-- Color Pic config (CccPick)
local status_ok, ccc = pcall(require, "ccc")
if not status_ok then
  return
end

--> setup
ccc.setup {
  default_input_mode = "RGB",
  default_output_mode = "HEX",
  bar_char = "━",
  -- point_char = "⦿━",
  point_char = "🔘️",
  highlight_mode = "bg",
  ---@type function
  output_line = ccc.output_line,
  ---@type table
  highlighter = {
    ---@type boolean
    auto_enable = false,
    ---@type integer
    max_byte = 50 * 1000 * 1000, -- 50 MB
    ---@type string[]
    filetypes = {},
    ---@type string[]
    excludes = {},
    ---@type boolean
    lsp = true,
  },
}
