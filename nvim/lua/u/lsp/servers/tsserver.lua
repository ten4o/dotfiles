local M = {}

M.enabled = true

M.config = {
	cmd =  { require('u.util').lsp_bin_dir .. '/typescript-language-server.cmd' },
}

return M
