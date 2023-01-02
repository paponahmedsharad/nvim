--> require formatter
local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
  return
end

--> require Utilities for creating configurations
local status_ok, util = pcall(require, "formatter.util")
if not status_ok then
  return
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
formatter.setup {
  logging = true, --> Enable or disable logging
  log_level = vim.log.levels.WARN, --> All formatter configurations are opt-in

  filetype = {
    -----------------> lua
    lua = {
      require("formatter.filetypes.lua").stylua, -- "formatter.filetypes.lua" defines default configurations for the

      function() -- You can also define your own configuration
        -- Supports conditional formatting
        if util.get_current_buffer_file_name() == "special.lua" then
          return nil
        end
        -- files
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end,
    },
    -----------------------> HTML ------------------>
    html = {
      function()
        return {
          exe = "prettierd",
          args = { vim.api.nvim_buf_get_name(0) },
          stdin = true,
        }
      end,
    },

    ---------------------> css -------------------->
    css = {
      function()
        return {
          exe = "prettierd",
          args = { vim.api.nvim_buf_get_name(0) },
          stdin = true,
        }
      end,
    },

    ---------------------> javascript -------------------->
    javascript = {
      function()
        return {
          exe = "prettierd",
          args = { vim.api.nvim_buf_get_name(0) },
          stdin = true,
        }
      end,
    },

    ---------------------> python -------------------->
    python = {
      function()
        return {
          exe = "yapf",
          -- exe = "black",
          args = { vim.api.nvim_buf_get_name(0) },
          stdin = true,
        }
      end,
    },

    -----------------------------------------------

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
}
