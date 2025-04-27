vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		require('vim.hl').on_yank({higroup = 'Visual', timeout = 100})
	end
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help", "lspinfo", "man", "qf", "startuptime" },
	callback = function()
                vim.keymap.set("n", "q",
                    "<cmd>close<CR>",
                    { noremap = true, silent = true, buffer = true }
                )
				vim.opt.buflisted = false
            end
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "zig",
	callback = function()
		vim.opt.expandtab = true
	end
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "asm",
	callback = function()
		vim.opt.tabstop = 8
		vim.opt.shiftwidth = 8
	end
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt.wrap = true
		vim.opt.spell = true
	end
})
