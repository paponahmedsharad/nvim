local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--> set leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " " --> space is the leader key

--────── <Esc> with jk/kj FromDifferentMode ───────────
map({ "i", "c", "v", "s" }, "jk", [[<Esc>]])
map({ "i", "c", "v", "s" }, "kj", [[<Esc>]])

--─────────────MotionKeys ForInsertMode──────────────
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-l>", "<Right>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)
map({ "i", "s" }, "<C-e>", "<Esc>A", opts)
-- map({ "i", "s" }, "<M-e>", "<Esc>A", opts)

--────────KeysForMovingInDifferentBuffer/Window──────
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

--─────────────── Inser NewLine ────────────────────
map({ "i", "s", "n" }, "fj", "<Esc>o", opts)
map({ "i", "s", "n" }, "jf", "<Esc>o", opts)
-- map({ "n" }, "<CR>", "<Cmd>call append(line('.'),repeat([''],v:count1))<CR>", opts)
map({ "n" }, "<S-CR>", "<Cmd>call append(line('.') -1,repeat([''],v:count1))<CR>", opts)
map({ "n" }, "<CR>", 'o<Esc>0"_D,v:count1', opts)

--─────────────── move around buffer ─────────────────
--> bufferline
map("n", "<S-h>", "<cmd>bprevious<CR>", opts)
map("n", "<S-l>", "<cmd>bnext<CR>", opts)

--────────Activate cmd mode with df/fd ───────────────
map({ "n" }, "df", [[:]])
map({ "n" }, "fd", [[:]])

--─────────────── General keymaps ───────────────────────
map("n", "<leader>q", "<cmd>qall!<CR>", { noremap = true })
map({ "n" }, "<leader>w", "<cmd>w<CR>", { noremap = true, silent = false }) --> save
map({ "n", "i" }, "<C-s>", "<cmd>w<CR>", { noremap = true, silent = false }) --> save
map("n", "ff", ":Telescope find_files<CR>", opts) --> Find files
map("n", "[", ":Telescope oldfiles<CR>", opts) --> Find recent files

--─────────────── Move the line ───────────────────────
map("v", "H", "<gv", opts)
map("v", "L", ">gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)

map("n", "<Down>", "<cmd>split<CR>", opts)
map("n", "<Left>", "<cmd>vsplit<CR>", opts)
map("n", "<Right>", "<cmd>vsplit<CR>", opts)
-- Better paste
map("v", "p", '"_dP', opts)

--──────── CopyCurrentParaAndPasteItBelow────────────────
map({ "n" }, "py", [[<Esc>yis}p]])
map({ "n" }, "yp", [[<Esc>yis}p]])

--────────── A fancy box around the text ────────────────
map("n", "<leader>1", ":.!toilet  -w 200 -f term -F border<CR>", opts)

--───────────── keymaps for some plugin ─────────────────
--> Harpoon (leader a and m)
map("n", "<leader>aa", ':lua require("harpoon.mark").add_file()<CR>', opts)
map("n", "<leader>m", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)

--> mapping for colorpicker ccc (<c-p>)
vim.keymap.set({ "i", "n" }, "<C-p>", [[<Esc>:CccPick<cr>]])

--> luaSnip
map("i", "<A-n>", "<Plug>luasnip-next-choice", opts) -- todo
map("n", "<A-g>", "<cmd>ChatGPT<cr>", opts)

--> fzf registers
map({ "n", "i" }, "<A-c>", "<cmd>FzfLua registers<CR>", opts)

--> telescope frecency
vim.api.nvim_set_keymap(
	"n",
	"  ",
	"<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
	{ noremap = true, silent = true }
)

--> replace the word under the cursor
map({ "n", "i" }, "<A-r>", [[<Esc>:%s/\<<C-r><C-w>\>/]])

--> LSP
map("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "hg", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<A-d>", "<cmd>lua vim.lsp.buf.definition()<CR>")

--> hop
-- map("n", "f", "<cmd>HopChar1<CR>")
-- map("n", "F", "<cmd>HopChar1BC<CR>")
map("n", ";", "<cmd>HopWord<CR>")
-- map({ "n", "i" }, "<A-f>", "<cmd>HopChar2<CR>")

--> leap
vim.keymap.set(
	{ "n", "i" },
	"<A-f>",
	"<cmd> lua require('leap').leap { target_windows = vim.tbl_filter( function (win) return vim.api.nvim_win_get_config(win).focusable end, vim.api.nvim_tabpage_list_wins(0))}<CR>",
	opts
)

--> cmp
map("i", "df", "<cmd>lua require('cmp').confirm({ select = true })<CR>")
map("i", "fd", "<cmd>lua require('cmp').confirm({ select = true })<CR>")

vim.cmd([[
"--> select the last item from lsp/cmp
im dk <C-k><CR>
im kd <C-k><CR>

"for command mode"
cm df <Tab>
cm fd <Tab>

" --> begging/end of the line "
im <A-i> <c-o>^
im <A-a> <c-o>A
]])

-----------------------> extra cinfigaration for neovide ------------>
--> paste in command line
-- map("c", "<C-v>", "<C-r>+", opts)

-------------------------------> testing ------------------------>
--> Change Letter Case
map("v", "<C-v>", [[<cmd>s#\v(\w)(\S*)#\u\1\L\2#g | noh<CR><Esc>]])
-- map("v", "<C-v>", [[<cmd>s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<CR><cmd>noh<CR><ESC>]])

--> A FUNCTION TO CHANGE VISUALL SELECT TEXT "CASE" with <S-~>
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

--> resize split
map("n", "=", [[<cmd>vertical resize +5<cr>]])
map("n", "-", [[<cmd>vertical resize -5<cr>]])
map("n", "+", [[<cmd>horizontal resize +2<cr>]])
map("n", "_", [[<cmd>horizontal resize -2<cr>]])
