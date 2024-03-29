local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

--> setup
comment.setup({
    padding = true,
    sticky = true,
    ignore = "^$",
    toggler = {
      -- line = "g ",
      line = "co",
      block = "gbc",
    },
    opleader = {
      line = "co",
      block = "gb",
    },
    extra = {
      above = "gcO",
      below = "gco",
      eol = "gcA",
    },
    mappings = {
      basic = true,
      extra = true,
      extended = false,
    },
    pre_hook = nil,
	post_hook = nil,
})
