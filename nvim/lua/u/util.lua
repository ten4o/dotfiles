M = {}

local mason_bin = require('mason.settings').current.install_root_dir .. '/bin'
M.lsp_bin_dir = mason_bin

return M
