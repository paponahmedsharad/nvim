local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
  return
end

toggleterm.setup{
  -- open_mapping = [[<c-\>]],
	open_mapping = [[<A-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  highlights = {
    -- highlights which map to a highlight group name and a table of it's values
    -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
    Normal = {
      guibg = "#1a1b26",
    },
    NormalFloat = {
      link = 'Normal'
    },
    CursorLine = {
      guibg = "#1a1b26",
    },
  },
  shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  -- shading_factor = '<number>', -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
	direction = "float",
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    border =  'curved',
    -- width = <value>,
    -- height = <value>,
    -- winblend = 9,
  },
}
