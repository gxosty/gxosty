local M = {}

M.name = "pyright"

M.opts = {
    cmd = { "pyright" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", ".git" },
}

return M

