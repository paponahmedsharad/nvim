--───────────── modified version of evil ───────────────
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local colors = {
  -- bg = "#232635",
  -- bg = "#1f1e2d",
  bg = "#1a1b26",
  bg1 = "#202328",
  ibg = "#1a1b26",
  fg = "#5da2c1",
  yellow = "#ECBE7B",
  cyan = "#005f6e",
  cyanorginal = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
  tokyobright = "#324a4e",
  file = "#98d799",
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand "%:p:h"
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

--───────────────── CUSTOM CONFIG ──────────────────────
local config = {
  options = {
    component_separators = "",
    section_separators = "",
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.ibg } },
      insert = { c = { fg = colors.fg, bg = colors.ibg } },
      command = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

--───────────────── component config ──────────────────────
-- ins_left {
--   function()
--     return "▊"
--   end,
--   color = function()
--     local mode_color = {
--       n = colors.bg,
--       i = colors.ibg,
--       c = colors.bg,
--       s = colors.bg,
--     }
--     return { fg = mode_color[vim.fn.mode()] }
--   end,
--   padding = { right = 1 },
-- }

ins_left {
  function()
    -- return '⬤ '
    return " "
  end,
  color = function()
    local mode_color = {
      n = "#809933",
      i = colors.ibg,
      v = colors.blue,
      [""] = colors.blue,
      V = colors.blue,
      [""] = colors.black,
      r = colors.cyan,
      ["r?"] = colors.cyan,
      ["!"] = colors.red,
      no = colors.red,
      t = colors.red,
      c = colors.bg,
      s = colors.ibg,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { left = 1 },
}

ins_left {
  "filename",
  icon = " ",
  cond = conditions.buffer_not_empty,
  color = function()
    local mode_color = {
      n = colors.cyanorginal,
      i = colors.ibg,
      v = colors.blue,
      [""] = colors.blue,
      V = colors.blue,
      c = colors.bg,
      s = colors.ibg,
    }
    return { fg = mode_color[vim.fn.mode()], gui = "bold" }
  end,
}

ins_left {
  "filesize",
  -- icon = '--> size:',
  icon = " size:",
  -- icon = '➥➩⍈ size:',
  cond = conditions.buffer_not_empty,
  color = function()
    local mode_color = {
      n = colors.tokyobright,
      i = colors.ibg,
      c = colors.bg,
      s = colors.ibg,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
}

ins_left {
  "progress",
  icon = "",
  -- color = { fg = colors.green, gui = '' },
  color = function()
    local mode_color = {
      n = colors.cyan,
      i = colors.ibg,
      c = colors.bg,
      s = colors.ibg,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
}

ins_left {
  function()
    return " "
  end,
  color = function()
    local mode_color = {
      n = colors.cyan,
      i = colors.tokyo,
      v = colors.blue,
      [""] = colors.blue,
      V = colors.blue,
      c = colors.bg,
      s = colors.ibg,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return "%="
  end,
}

-- ins_left {
--   -- Lsp server name .
--   function()
--     local msg = ''
--     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--     local clients = vim.lsp.get_active_clients()
--     if next(clients) == nil then
--       return msg
--     end
--     for _, client in ipairs(clients) do
--       local filetypes = client.config.filetypes
--       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--         return client.name
--       end
--     end
--     return msg
--   end,
--   icon = ' LSP:',
--   color = { fg = "673e51", gui = 'bold' },
--   color = function()
--     local mode_color = {
--       n = colors.cyan,
--       i = colors.ibg,
--     }
--     return { fg = mode_color[vim.fn.mode()] }
--   end,
-- }
------------------------------------------------------->

ins_right {
  -- Lsp server name .
  function()
    local msg = ""
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = " LSP:",
  color = { fg = "673e51", gui = "bold" },
  color = function()
    local mode_color = {
      n = colors.cyan,
      i = colors.ibg,
      s = colors.ibg,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
}

-- ins_right {
--   "progress",
--   icon = "",
--   -- color = { fg = colors.green, gui = '' },
--   color = function()
--     local mode_color = {
--       n = colors.cyan,
--       i = colors.ibg,
--       c = colors.bg,
--       s = colors.ibg,
--     }
--     return { fg = mode_color[vim.fn.mode()] }
--   end,
-- }

-- -- make a funtuin to get battery status from /sys/class/power_supply/BAT0/capacity
-- local function get_battery()
--   local f = io.open "/sys/class/power_supply/BAT1/capacity"
--   local s = f:read()
--   f:close()
--   return s
-- end

-- ins_right {
--   function()
--     local time = os.date "%H:%M"
--     return time
--   end,
--   icon = " ",
--   -- color = { fg = colors.cyan, gui = "" },
--   color = function()
--     local mode_color = {
--       n = colors.cyan,
--       i = colors.ibg,
--       c = colors.bg,
--       s = colors.ibg,
--     }
--     return { fg = mode_color[vim.fn.mode()] }
--   end,
-- }

ins_right {
  "fileformat",
  fmt = string.upper,
  icons_enabled = true,
  -- color = { fg = colors.green, gui = '' },
  color = function()
    local mode_color = {
      n = colors.green,
      i = colors.ibg,
      c = colors.bg,
      s = colors.ibg,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
}

ins_right {
  "branch",
  icon = "",
  -- color = { fg = colors.magenta, gui = 'bold' },
  color = function()
    local mode_color = {
      n = colors.cyanorginal,
      i = colors.ibg,
      c = colors.bg,
      s = colors.ibg,
    }
    return { fg = mode_color[vim.fn.mode()], gui = "bold" }
  end,
}

ins_right {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.cyan },
    color_info = { fg = colors.cyan },
  },
}

-- ins_right {
--   function()
--     return "▊"
--   end,
--   color = function()
--     local mode_color = {
--       n = colors.bg,
--       -- n = colors.magenta,
--       i = colors.ibg,
--       c = colors.bg,
--       s = colors.bg,
--     }
--     return { fg = mode_color[vim.fn.mode()] }
--   end,
--   padding = { left = 1 },
-- }

-- Now don't forget to initialize lualine
lualine.setup(config)
