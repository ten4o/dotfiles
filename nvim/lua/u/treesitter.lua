local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = {"bash", "c", "cpp", "cmake",
		"css", "html", "json", "make", "markdown",
		"python", "lua", "typescript", "vue", "zig"
	}, -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
})
