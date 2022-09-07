local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

function keymap_n(old_keys, new_keys)
	keymap("n", old_keys, new_keys, opts)
end
function keymap_i(old_keys, new_keys)
	keymap("i", old_keys, new_keys, opts)
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--Remap , as leader key
vim.g.mapleader = ","

keymap_n("<Space>", "<PageDown>")

keymap_n('<Leader>e', vim.diagnostic.open_float)
keymap_n('[d', vim.diagnostic.goto_prev)
keymap_n(']d', vim.diagnostic.goto_next)
keymap_n('<Leader>q', vim.diagnostic.setloclist)

keymap_n("<C-n>", ":NvimTreeToggle<CR>")
keymap_i("<C-n>", "<ESC>:NvimTreeToggle<CR>")

keymap_n("<C-s>", ":set invspell<CR>")
keymap_i("<C-s>", "<ESC>:set invspell<CR>i")

-- Use 'Y' to yank into the system clipboard
keymap("", "Y", "\"+y", opts)

-- Use 'cc' to enter command mode
-- keymap_n("cc", ":")

-- Resize with arrows
keymap_n("<C-Up>", ":resize -2<CR>")
keymap_n("<C-Down>", ":resize +2<CR>")
keymap_n("<C-Left>", ":vertical resize -2<CR>")
keymap_n("<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap_n("<S-l>", ":bnext<CR>")
keymap_n("<S-h>", ":bprevious<CR>")

-- Telescope
keymap_n("<C-p>", ":Telescope find_files<CR>")
keymap_n("<C-f>", ":Telescope grep_string<CR>")
keymap_n("<C-g>", ":Telescope live_grep<CR>")

