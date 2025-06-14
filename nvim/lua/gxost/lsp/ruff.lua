local M = {}

M.name = "ruff"

M.opts = {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", ".git" },
    capabilities = CMP_CAPABILITIES
}

return M
