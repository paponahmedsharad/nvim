local M = {}
-- Default configuration
local default_config = {
  term_size = 10,
  direction = 'horizontal',
  compiler = { lua = 'lua', javascript = 'bun run', typescript = 'bun run', python = 'python', c = 'gcc % -o %< && ./%<', cpp = 'g++ % -o %< && ./%< -lstdc++', rust = 'rustc % && ./%<' }
}

-- Terminal height/width
local function term_size()
  return default_config.term_size
end

-- Terminal direction
local function direction()
  return default_config.direction
end

-- Compiler based on filetype
local function compiler_for(filetype)
  return default_config.compiler[filetype] or ''
end

-- Function to run code
function M.run()
  local filetype = vim.bo.filetype
  local size = term_size()
  local dir = direction()
  local compiler_cmd = compiler_for(filetype)

  -- Only run if a compiler command is set for the current filetype
  if compiler_cmd ~= '' then
    local command = string.format("TermExec size=%d cmd='%s %%' direction=%s", size, compiler_cmd, dir)
    vim.cmd(command)
  else
    print("No compiler set for filetype: " .. filetype)
  end
end

return M
