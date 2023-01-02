local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
  impatient.enable_profile()
end

require "packer-plugins.plugins"
require "colorscheme"
require "options"
require "keymappings"
require "whichkey"
require "autocommand"
require "neotree"
require "statusline-lualine"
require "bufferline-config"
require "treesitter-config"
require "telescope-config"
require "luasnip-config"
require "cmp-config"
require "toggleterm-config"
require "autopairs-config"
require "colorizer-config"
require "color-picker"
require "lsp"
require "formatter-config"
require "comment"
require "smoth-scroll"
require "neoclip-config"
require "coq-config"
require "indentlines"
require "fzf-lua"
require "notify-config"
require "highlighter"
require "session"
require("leap").add_default_mappings()
