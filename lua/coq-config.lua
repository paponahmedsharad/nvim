-- local status_ok, coq_settings = pcall(require, "coq")
-- if not status_ok then
--   return
-- end

local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

notify.setup {
  background_colour = "Normal",
  fps = 60,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = "",
  },
  level = 2,
  minimum_width = 50,
  -- render = "default",
  render = "minimal",
  -- stages = "fade_in_slide_out",
  stages = "fade",
  timeout = 3000,
  top_down = true,
}
