--> if available call bufferline
local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

--> Define Colors
local colors = {
  selected_bg = "#31314b",
  selected_fg = "#244134",
  -- unfocused_bg = "#171614",
  unfocused_bg = "#212332",
  unfocused_fg = "#34713f",
  fill_bg = "#1f202b",
  fill_fg = "#ffffff",
  yellow = "#ece61a",
}
--> setup ------------------------>
bufferline.setup {
  highlights = {
    fill = {
      fg = colors.fill_bg,
      bg = colors.fill_bg,
    },
    background = { --> colors of unfocused tab
      fg = colors.unfocused_fg,
      bg = colors.unfocused_bg,
      bold = true,
    },
    buffer_visible = {
      fg = colors.unfocused_fg,
      bg = colors.unfocused_bg,
    },
    buffer_selected = {
      fg = "#ff5da0",
      bg = colors.selected_bg,
      bold = true,
      italic = false,
    },
    numbers = {
      fg = colors.unfocused_fg,
      bg = colors.unfocused_bg,
    },
    numbers_visible = {
      fg = colors.unfocused_fg,
      bg = colors.unfocused_bg,
    },
    numbers_selected = {
      fg = "#ff6600",
      bg = colors.selected_bg,
    },

    modified = {
      fg = "#a30000",
      bg = colors.unfocused_bg,
    },
    modified_visible = {
      fg = "#ff4d44",
      bg = colors.unfocused_bg,
    },
    modified_selected = {
      fg = "#ff4d44",
      bg = colors.selected_bg,
    },

    separator = {
      fg = colors.selected_fg,
      bg = colors.unfocused_bg,
    },
    separator_visible = {
      fg = colors.unfocused_bg,
      bg = colors.unfocused_bg,
    },
    separator_selected = {
      fg = colors.fill_bg,
      bg = colors.selected_bg,
    },

    offset_separator = {
      fg = colors.selected_bg,
      bg = colors.selected_bg,
    },
  },
  --> options ---------------------------->
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "ordinal", --"none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    indicator = {
      icon = "▎", -- this should be omitted if indicator style is not 'icon'
      style = "none",
      -- style = 'icon' | 'underline' | 'none',
    },
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
    --     -- remove extension from markdown files for example
    --     if buf.name:match('%.md') then
    --         return vim.fn.fnamemodify(buf.name, ':t:r')
    --     end
    -- end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
    },
    color_icons = true, -- whether or not to add the filetype icon highlights
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = false,
    show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
    show_close_icon = false,
    show_tab_indicators = true,
    -- persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    -- separator_style = "slant",
    separator_style = "thin",
    -- separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
    -- enforce_regular_tabs = false | true,
    always_show_bufferline = false,
    -- sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    --     -- add custom logic
    --     return buffer_a.modified > buffer_b.modified
    -- end

    --> diagonostic
    diagnostics = "nvim_lsp", --> buffername color will change acording to diagonostic
  },
}
