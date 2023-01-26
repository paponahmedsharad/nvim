-- local status_ok, notify = pcall(require, "notify")
-- if not status_ok then
--   return
-- end

require("notify").setup {
  -- notify.setup {
  background_colour = "normal",
  fps = 60,
  icons = {
    debug = "",
    error = "",
    info = "",
    trace = "✎",
    warn = "",
  },
  level = 2,
  minimum_width = 50,
  render = "minimal",
  -- stages = "fade_in_slide_out",
  stages = "fade",
  timeout = 1000,
  top_down = true,
}
