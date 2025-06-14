local M = {}

M.name = "luals"

M.opts = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { { ".luarc.json", "luarc.jsonc" }, ".git" },
    capabilities = CMP_CAPABILITIES
}

return M
