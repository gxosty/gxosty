local M = {}

M.name = "jdtls"

M.opts = {
    cmd = { "jdtls" },
    filetypes = { "java" },
    root_markers = { "settings.gradle", "build.gradle", ".git" },
    capabilities = CMP_CAPABILITIES
}

return M
