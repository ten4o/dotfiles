-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.isdirectory(install_path) < 1 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup(function(use)
	-- My plugins here
	use({ "lewis6991/impatient.nvim" })
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" })
	use({ "kyazdani42/nvim-web-devicons" }) -- Required by nvim-tree and lualine
	use({ "kyazdani42/nvim-tree.lua"}) --  optional 'kyazdani42/nvim-web-devicons', for file icons

	-- Status line
	use({ "nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true }
	})

	-- Colorschemes
	use("Mofiqul/vscode.nvim")

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp"}) -- The completion plugin
	use({ "hrsh7th/cmp-buffer"}) -- buffer completions
	use({ "hrsh7th/cmp-path"}) -- path completions
	use({ "hrsh7th/cmp-nvim-lsp"})
	-- use({ "hrsh7th/cmp-nvim-lua"})
	use({ "saadparwaiz1/cmp_luasnip"}) -- snippet completions

	-- snippets
	use({ "L3MON4D3/LuaSnip"}) --snippet engine
	use({ "rafamadriz/friendly-snippets"}) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig"}) -- enable LSP
	use({ "williamboman/mason.nvim" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim",
	  requires = { {"nvim-lua/plenary.nvim"} }
	})

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter",
		-- run = ':TSUpdate' will fail the first time
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
