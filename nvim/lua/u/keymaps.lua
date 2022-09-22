-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
local opts = { noremap = true, silent = true }

local function keymap_n(old_keys, new_keys, popts)
	vim.keymap.set("n", old_keys, new_keys, popts or opts)
end
local function keymap_i(old_keys, new_keys, popts)
	vim.keymap.set("i", old_keys, new_keys, popts or opts)
end

--Remap , as leader key
vim.g.mapleader = ","

keymap_n("<Space>", "<PageDown>")
keymap_n("<C-q>", ":qall<CR>")

-- Spell checking
keymap_n("<C-s>", ":set invspell<CR>")
keymap_i("<C-s>", "<ESC>:set invspell<CR>i")

keymap_n("<F12>", function()
--	require("mason").setup{}
    require("mason.ui").open()
end)

-- Nvim Tree
keymap_n("<C-n>", ":NvimTreeToggle<CR>")
keymap_i("<C-n>", "<ESC>:NvimTreeToggle<CR>")

-- Use 'Y' to yank into the system clipboard
vim.keymap.set({'n','v','x','t'}, "Y", "\"+y", opts)

-- Use 'cc' to enter command mode
-- keymap_n("cc", ":")

-- Resize with arrows
keymap_n("<C-Up>", ":resize -2<CR>")
keymap_n("<C-Down>", ":resize +2<CR>")
keymap_n("<C-Left>", ":vertical resize -2<CR>")
keymap_n("<C-Right>", ":vertical resize +2<CR>")
-- vim.keymap.set({'t'}, "<C-Up>", "<C-\\><C-n>:resize -2<CR>i", opts)
-- vim.keymap.set({'t'}, "<C-Down>", "<C-\\><C-n>:resize +2<CR>i", opts)

-- Navigate Windows
keymap_n("<C-j>", "<C-w>j")
keymap_n("<C-h>", "<C-w>h")
keymap_n("<C-l>", "<C-w>l")

-- Navigate buffers
keymap_n("<S-l>", ":bnext<CR>")
keymap_n("<S-h>", ":bprevious<CR>")

-- Remove current buffer
keymap_n("<leader>c", function()
	local bufnr = vim.api.nvim_win_get_buf(0)
	vim.cmd("bnext")
	vim.cmd("bdelete " .. bufnr)
end)

-- Telescope
keymap_n("<C-p>", ":Telescope find_files<CR>")
keymap_n("<C-f>", ":Telescope grep_string<CR>")
keymap_n("<C-g>", ":Telescope live_grep<CR>")

-- Terminal
-- vim.keymap.set({'n','t'}, '<leader>t', function() LuaTerminalToggle() end)
-- vim.keymap.set('t', '<Esc>', function() LuaTerminalToggle() end)

-- Lsp
function Lsp_keymaps(bufnr)
	local opts = { noremap=true, silent=true, buffer=bufnr }
	keymap_n("gD", vim.lsp.buf.declaration, opts)
	keymap_n("gd", vim.lsp.buf.definition, opts)
	keymap_n("gi", vim.lsp.buf.implementation, opts)
	keymap_n("gr", vim.lsp.buf.references, opts)
	keymap_n("K", vim.lsp.buf.hover, opts)
	keymap_n("<C-k>", vim.lsp.buf.signature_help, opts)
	-- keymap_n("<leader>rn", vim.lsp.buf.rename, opts)
	keymap_n("<leader>ca", vim.lsp.buf.code_action, opts)
	keymap_n("[d", vim.diagnostic.goto_prev, opts)
	keymap_n("]d", vim.diagnostic.goto_next, opts)
	keymap_n("<Leader>e", vim.diagnostic.open_float, opts)
	keymap_n("<Leader>q", vim.diagnostic.setloclist, opts)
	keymap_n("<Leader>f", vim.lsp.buf.formatting, opts)
end
