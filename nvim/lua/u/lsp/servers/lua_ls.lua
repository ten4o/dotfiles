local M = {}

M.enabled = true

M.config = {
	cmd =  { require('u.util').lsp_bin_dir .. '/lua-language-server.cmd' },
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	}
}

return M
