local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local nosilent = { noremap = true, silent = true }

--> set leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " " --> leader key

--> Escape from different modes
map({ "i", "c", "v", "s" }, "jk", [[<Esc>]])
map({ "i", "c", "v", "s" }, "kj", [[<Esc>]])

--> motion keys for insert mode
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-l>", "<Right>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)

--> move between splits
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

--> resize split
map("n", "=", [[<cmd>vertical resize +5<cr>]])
map("n", "-", [[<cmd>vertical resize -5<cr>]])
map("n", "+", [[<cmd>horizontal resize +2<cr>]])
map("n", "_", [[<cmd>horizontal resize -2<cr>]])

--> Move to different buffers
map("n", "<S-h>", "<cmd>bprevious<CR>", opts)
map("n", "<S-l>", "<cmd>bnext<CR>", opts)
map("n", "<Tab>", "<cmd>tabnext<CR>", opts)

--> insert a new line
map({ "i", "s", "n" }, "fj", "<Esc>o", opts)
map({ "i", "s", "n" }, "jf", "<Esc>o", opts)
map({ "n" }, "<CR>", 'o<Esc>0"_D,v:count1', opts)
map({ "n" }, "<S-CR>", "<Cmd>call append(line('.') -1,repeat([''],v:count1))<CR>", opts)
-- map({ "n" }, "<CR>", "<Cmd>call append(line('.'),repeat([''],v:count1))<CR>", opts)

--> command mode with df and fd
map({ "n" }, "df", [[:]])
map({ "n" }, "fd", [[:]])

--> quit and save
map("n", "<leader>q", "<cmd>qall!<CR>", nosilent) --> quit all
map({ "n" }, "<leader>w", "<cmd>w<CR>", nosilent) --> save
map({ "n", "i" }, "<C-s>", "<cmd>w<CR>", nosilent) --> save

--> move the line up/down left/right
map("v", "H", "<gv", opts)
map("v", "L", ">gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)

--> split the window
map("n", "<S-Down>", "<cmd>split<CR>", opts)
map("n", "<S-Left>", "<cmd>vsplit<CR>", opts)
map("n", "<S-Right>", "<cmd>vsplit<CR>", opts)

--> Better paste
map("v", "p", '"_dP', opts)

--> remove all keymaps for for all modes
map("n", "<leader>rk", "<cmd>mapclear<CR><cmd>imapclear<CR>", opts)

--> select all
map("n", "<C-a>", "ggVG", opts)

--> paste from clipboard in insert mode
map("i", "<C-v>", "<C-r>+")

--> Direct changes into the black hole register.
map("n", "c", '"_c')
map("n", "C", '"_C')
map("n", "x", '"_x')

--> Clone paragraph.
map("n", "cp", "yap<S-}>p")
-- map({ "n" }, "py", [[<Esc>yis}p]])
-- map({ "n" }, "yp", [[<Esc>yis}p]])

--> replace the word under the cursor
map({ "n", "i" }, "<A-r>", [[<Esc>:%s/\<<C-r><C-w>\>/]])

--> a fancy box around the text
map("n", "<leader>1", ":.!toilet  -w 200 -f term -F border<CR>", opts)

vim.cmd([[
"--> select the last item from lsp/cmp
im dk <C-k><C-k><C-Space>
im kd <C-k><C-k><C-Space>
"for command mode"
" cm df <Tab>
" cm fd <Tab>
cm df <c-y>
cm fd <c-y>
" --> begging/end of the line "
im <M-i> <c-o>^
im <M-a> <c-o>A
" --> end of the para
im <A-n> <Esc>}o
]])


--> vertical selection mode
map({ "i" }, "<c-m>", "<c-o><c-v>")

--> run norm commands in insert mode
map({ "i" }, "<C-i>", "<Esc>u@.")

--> A FUNCTION TO CHANGE VISUALLY SELECT TEXT "CASE" with <S-~>
vim.cmd([[
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv
]])

--──────────────────────────────────────────────────────────────────────
-->                        Plugins keymaps
--──────────────────────────────────────────────────────────────────────
--> telescope
map("n", "ff", ":Telescope find_files<CR>", opts) --> Find files
map("n", "  ", ":Telescope find_files<CR>", opts) --> Find files
map("n", "\\", ":Telescope oldfiles<CR>", opts) --> Find recent files

--> Harpoon
-- map("n", "<leader>aa", ':lua require("harpoon.mark").add_file()<CR>', opts)
map("n", "<leader>m", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)

--> colorpicker
vim.keymap.set({ "i", "n" }, "<C-p>", "<cmd>PickColorInsert<CR>", opts)

--> luaSnip
-- map("i", "<A-n>", "<Plug>luasnip-next-choice", opts) -- todo

--> ChatGPT
map("n", "<A-g>", "<cmd>ChatGPT<cr>", opts)

--> fzf registers
-- map({ "n", "i" }, "<A-c>", "<cmd>FzfLua registers<CR>", opts)
map({ "n", "i" }, "<A-c>", "<cmd>FzfLua files<CR>", opts)

--> telescope frecency
vim.api.nvim_set_keymap(
	"n",
	",,",
	"<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
	{ noremap = true, silent = true }
)

--> LSP
map("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "hg", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<A-d>", "<cmd>lua vim.lsp.buf.definition()<CR>")

--> hop
-- map("n", ";", "<cmd>HopWord<CR>")
-- map("n", "f", "<cmd>HopChar1<CR>")

--> leap
map({ "n", "x", "o" }, "f", "<Plug>(leap-forward-to)")
vim.keymap.set(
	{ "n", "i", "v" },
	"<A-f>",
	"<cmd> lua require('leap').leap { target_windows = vim.tbl_filter( function (win) return vim.api.nvim_win_get_config(win).focusable end, vim.api.nvim_tabpage_list_wins(0))}<CR>",
	opts
)

--> cmp
map("i", "df", "<cmd>lua require('cmp').confirm({ select = true })<CR>")
map("i", "fd", "<cmd>lua require('cmp').confirm({ select = true })<CR>")

--> lspsaga
map("n", "<S-h>", "<cmd>Lspsaga hover_doc<CR>")

--> Emmet
map({ "i" }, "<A-;>", "<c-o>:Emmet ")
map({ "n" }, "<A-;>", ":Emmet ")
