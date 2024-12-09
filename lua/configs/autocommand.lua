local fn = vim.fn
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local general = augroup("General Settings", { clear = true })
augroup("_buffer", {})

autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	group = general,
	desc = "Disable autocommenting in new lines",
})

--> Highlight while yanking
-- autocmd("TextYankPost", {
-- 	pattern = "*",
-- 	desc = "Highlight while yanking",
-- 	group = "_buffer",
-- 	callback = function()
-- 		vim.highlight.on_yank({ higroup = "Visual" })
-- 	end,
-- })

-- 8. Effect: Briefly flash on yank
autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = augroup("highlightyank", { clear = true }),
  pattern = "*",
  callback = function() vim.highlight.on_yank() end,
})
autocmd("FileType", {
	desc = "Quit with q in this filetypes",
	group = "_buffer",
	pattern = "qf,help,man,lspinfo,startuptime,Trouble",
	callback = function()
		vim.keymap.set("n", "q", "<CMD>close<CR>")
	end,
})

-- 7. Make q close help, man, quickfix, dap floats
autocmd("BufWinEnter", {
  desc = "Make q close help, man, quickfix, dap floats",
  group = augroup("q_close_windows", { clear = true }),
  callback = function(event)
    local filetype =
      vim.api.nvim_get_option_value("filetype", { buf = event.buf })
    local buftype =
      vim.api.nvim_get_option_value("buftype", { buf = event.buf })
    if buftype == "nofile" or filetype == "help" then
      vim.keymap.set(
        "n",
        "q",
        "<cmd>close<cr>",
        { buffer = event.buf, silent = true, nowait = true }
      )
    end
  end,
})

autocmd("FileType", {
	pattern = { "c", "javascript", "py", "css" },
	callback = function()
		vim.bo.shiftwidth = 4
	end,
	group = general,
	desc = "Set shiftwidth to 4 in these filetypes",
})

--> Trim whitespace
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

autocmd("BufWritePre", {
	desc = "Trim whitespace on save",
	group = "_buffer",
	command = [[call NoWhitespace()]],
})

--> Restore Cursor position
autocmd("BufReadPost", {
	desc = "Restore cursor position upon reopening the file",
	group = "_buffer",
	command = [[
       if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"zvzz" | endif
    ]],
})


-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

--[[ autocmd("BufReadPost", {
	callback = function()
		if fn.line("'\"") > 1 and fn.line("'\"") <= fn.line("$") then
			vim.cmd('normal! g`"')
		end
	end,
	group = general,
	desc = "Go To The Last Cursor Position",
}) ]]


-- autocmd("CursorHold", {
-- 	command = "echon ''",
-- 	desc = "clear cmdline on cursorhold",
-- })

--> lsp diagonostic
-- augroup("_lsp", {})
-- autocmd({ "CursorHold" }, {
-- 	desc = "Open float when there is diagnostics",
-- 	group = "_lsp",
	-- callback = vim.diagnostic.open_float,

	-- callback = vim.lsp.buf.signature_help,
	-- callback = require("lspsaga.diagnostic").show_line_diagnostics,
	-- command = [[Lspsaga show_line_diagnostics]],
-- })

-- autocmd("VimResized", {
--   callback = function()
--     vim.cmd "wincmd ="
--   end,
--   group = general,
--   desc = "Equalize Splits",
-- })

-- cmd({ "FocusGained", "CursorHold" }, {
--   desc = "Actions when the file is changed outside of Neovim",
--   group = "_auto_reload_file",
--   command = [[if getcmdwintype() == '' | checktime | endif]],
-- })

--> auto formatter
-- augroup("FormatAutogroup", {})
-- autocmd({ "BufWritePost" }, {
-- 	desc = "Format file via nvim-formatter",
-- 	command = "FormatWrite",
-- })


--> lspsaga
-- vim.cmd([[autocmd CursorHold *.js,*.ts,*.lua :Lspsaga show_line_diagnostics]])
