local M = {}

M.name = "clangd"

M.opts = {
    cmd = { "clangd", "--completion-style=detailed" },
    filetypes = { "c", "cpp" },
    capabilities = CMP_CAPABILITIES
}

return M
