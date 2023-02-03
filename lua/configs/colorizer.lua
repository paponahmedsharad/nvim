local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

--> setup
colorizer.setup({ "*" }, {
  names = true,
  RGB = true, -- #RGB hex codes
  RRGGBB = true, -- #RRGGBB hex codes
  RRGGBBAA = true, -- #RRGGBBAA hex codes
  rgb_fn = true, -- CSS rgb() and rgba() functions
  hsl_fn = true, -- CSS hsl() and hsla() functions
  css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
})

-----------------------> highlight word under cursor ----------->
-- local status_ok, murmur = pcall(require, "murmur")
-- if not status_ok then
--   return
-- end

-- murmur.setup {
--   -- cursor_rgb = 'purple', -- default to '#393939'
--   max_len = 80, -- maximum word-length to highlight
--   -- min_len = 3,
--   -- disable_on_lines = 2000, -- to prevent lagging on large files. Default to 2000 lines.
--   exclude_filetypes = {},
--   callbacks = {
--     -- to trigger the close_events of vim.diagnostic.open_float.
--     function()
--       -- Close floating diag. and make it triggerable again.
--       vim.cmd "doautocmd InsertEnter"
--       vim.w.diag_shown = false
--     end,
--   },
-- }
-- vim.api.nvim_create_autocmd("CursorHold", {
--   group = FOO,
--   pattern = "*",
--   callback = function()
--     -- skip when a float-win already exists.
--     if vim.w.diag_shown then
--       return
--     end

--     -- open float-win when hovering on a cursor-word.
--     if vim.w.cursor_word ~= "" then
--       vim.diagnostic.open_float(nil, {
--         focusable = true,
--         close_events = { "InsertEnter" },
--         border = "rounded",
--         source = "always",
--         prefix = " ",
--         scope = "cursor",
--       })
--       vim.w.diag_shown = true
--     end
--   end,
-- })
