-- disable netrw
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require "impatient"
require "u.autocommands"
require "u.options"
require "u.keymaps"
require "u.plugins"
require "u.colorscheme"
require "u.completion"
require "u.telescope"
require "u.treesitter"
require "u.nvim-tree"
require "u.lsp"
require "lualine".setup()
-- require "u.terminal"

