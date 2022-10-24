local opts = {
	on_attach = function(_, bufnr)
		Lsp_keymaps(bufnr)
	end
}

local lspconfig = require("lspconfig")

local server_paths = vim.api.nvim_get_runtime_file('lua/u/lsp/servers/*.lua', true)
for _, sp in pairs(server_paths) do
	local server_name = string.match(sp, '([^\\/]+)%.lua$')
	local server = require('u.lsp.servers.' .. server_name)
	if server['enabled'] then
		local loc_opts = {}
		for k,v in pairs(opts) do loc_opts[k] = v end
		if server['config'] ~= nil then
			for k,v in pairs(server.config) do loc_opts[k] = v end
		end
		lspconfig[server_name].setup(loc_opts)
	end
end

require("u.lsp.null-ls")
