local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

----------------- Change default lsp diagnostics text/sign -----------------
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "✘" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }
  vim.cmd [[hi DiagnosticSignHint guifg=#97bc00 guibg=NONE]]
  vim.cmd [[hi DiagnosticSignError guifg=#ff0000 guibg=NONE]]
  vim.cmd [[hi DiagnosticSignWarn guifg=#9980ff guibg=NONE]]
  vim.cmd [[hi DiagnosticSignInfo guifg=#ff0041 guibg=NONE]]

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = false,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  --> Change lsp appearence
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end

------------------------------ keymaps for lsp -------------------------
local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
  keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
  keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
  keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

---------------------------------------------------------------->
M.on_attach = function(client, bufnr) --> disable document formatting for these LSPs
  if client.name == "tsserver" or client.name == "html" or client.name == "sumneko_lua" then
    return
  end

  if client.name == "sumneko_lua" then
    return
  end

  lsp_keymaps(bufnr)
  -- local status_ok, illuminate = pcall(require, "illuminate")
  -- if not status_ok then
  --   return
  -- end
  -- illuminate.on_attach(client)
end

return M

------------------------> ts server setting----------------->
-- if client.name == "tsserver" then
--   local ts_utils = require "nvim-lsp-ts-utils"

--   -- defaults
--   ts_utils.setup {
--     debug = false,
--     disable_commands = false,
--     enable_import_on_completion = true,

--     -- import all
--     import_all_timeout = 5000, -- ms
--     -- lower numbers = higher priority
--     import_all_priorities = {
--       same_file = 1, -- add to existing import statement
--       local_files = 2, -- git files or files with relative path markers
--       buffer_content = 3, -- loaded buffer content
--       buffers = 4, -- loaded buffer names
--     },
--     import_all_scan_buffers = 100,
--     import_all_select_source = false,
--     -- if false will avoid organizing imports
--     always_organize_imports = true,

--     -- filter diagnostics
--     filter_out_diagnostics_by_severity = {},
--     filter_out_diagnostics_by_code = {},

--     -- inlay hints
--     auto_inlay_hints = true,
--     inlay_hints_highlight = "Comment",
--     inlay_hints_priority = 200, -- priority of the hint extmarks
--     inlay_hints_throttle = 150, -- throttle the inlay hint request
--     inlay_hints_format = { -- format options for individual hint kind
--       Type = {},
--       Parameter = {},
--       Enum = {},
--     },

--     -- update imports on file move
--     update_imports_on_move = false,
--     require_confirmation_on_move = false,
--     watch_dir = nil,
--   }

--   -- required to fix code action ranges and filter diagnostics
--   ts_utils.setup_client(client)

--   -- no default maps, so you may want to define some here
--   -- local opts = { silent = true }
--   -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gs", ":TSLspOrganize<CR>", opts)
--   -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rf", ":TSLspRenameFile<CR>", opts)
