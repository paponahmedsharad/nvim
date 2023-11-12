require("configs.keymaps")
require("configs.options")
require("configs.plugins")
require("configs.autocommand")
require("configs.whichkey")
require("configs.treesitter")
require("configs.telescope")
require("configs.cmp")
require("configs.luasnip")
require("configs.toggleterm")
require("configs.comment")
require("configs.lsp-conf")
require("configs.input").setup()
require("configs.colorscheme")
require("code_runner").setup({ term = { size = 4 } })

-- require("configs.tabby")
-- require("configs.lsp")
-- require("configs.statusline")
-- require("leap").add_default_mappings()
-- require("configs.knap")
