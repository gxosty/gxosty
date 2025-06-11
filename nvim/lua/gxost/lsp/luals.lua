local M = {}

M.name = "luals"

M.opts = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { { ".luarc.json", "luarc.jsonc" }, ".git" },
}

return M
