local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup("_terminal", {})

-- Disable autocommenting
cmd("BufEnter", {
  desc = "Disable autocommenting in new lines",
  command = "set fp-=c fo-=r fo-=o",
})

--> clear the cmdline in cursorhold
cmd("CursorHold", {
  command = "echon ''",
})

augroup("_buffer", {})
-- Trim whitespace
local NoWhitespace = vim.api.nvim_exec(
  [[
    function! NoWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfunction
    call NoWhitespace()
    ]],
  true
)

cmd("BufWritePre", {
  desc = "Trim whitespace on save",
  group = "_buffer",
  command = [[call NoWhitespace()]],
})

--> auto hide statusbar
-- cmd("InsertEnter", {
--   desc = "Hide the statusbar",
--   command = [[lua vim.o.ls=0, lua vim.o.ch=0]],
-- })

-- cmd("InsertLeave", {
--   desc = "Show the statusbar",
--   command = [[lua vim.o.ls=2, lua vim.o.ch=1]],
-- })

--> Restore Cursor position
cmd("BufReadPost", {
  desc = "Restore cursor position upon reopening the file",
  group = "_buffer",
  command = [[
       if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"zvzz" | endif
    ]],
})

-- Highlight while yanking
cmd("TextYankPost", {
  pattern = "*",
  desc = "Highlight while yanking",
  group = "_buffer",
  callback = function()
    vim.highlight.on_yank { higroup = "Visual" }
  end,
})

cmd("FileType", {
  desc = "Quit with q in this filetypes",
  group = "_buffer",
  pattern = "qf,help,man,lspinfo,startuptime,Trouble",
  callback = function()
    vim.keymap.set("n", "q", "<CMD>close<CR>")
  end,
})

-- Nofity when file changes
augroup("_auto_reload_file", {})
cmd("FileChangedShellPost", {
  desc = "Actions when the file is changed outside of Neovim",
  group = "_auto_reload_file",
  callback = function()
    vim.notify("File changed, reloading the buffer", vim.log.levels.ERROR)
  end,
})

cmd({ "FocusGained", "CursorHold" }, {
  desc = "Actions when the file is changed outside of Neovim",
  group = "_auto_reload_file",
  command = [[if getcmdwintype() == '' | checktime | endif]],
})

--> lsp diagonostic
augroup("_lsp", {})
cmd({ "CursorHold" }, {
  desc = "Open float when there is diagnostics",
  group = "_lsp",
  callback = vim.diagnostic.open_float,
  -- callback = vim.lsp.buf.signature_help,
})

--------> auto formatter ------------>
augroup("FormatAutogroup", {})
cmd({ "BufWritePost" }, {
  desc = "Format file via nvim-formatter",
  command = "FormatWrite",
})

-------------------> test ------------------>

--> hide statusline for help/.txt buf
-- cmd("BufEnter *.txt", {
--   command = [[lua vim.o.ls=0, lua vim.o.ch=0]],
-- })

-- cmd("BufLeave *.txt", {
--   command = [[lua vim.o.ls=2, lua vim.o.ch=1]],
-- })

--> hide statusline when i am reading help doc
vim.cmd [[autocmd BufRead */doc/*.txt lua vim.o.ls=0, lua vim.o.ch=0]]
vim.cmd [[autocmd BufLeave */doc/*.txt lua vim.o.ls=2, lua vim.o.ch=1]]
