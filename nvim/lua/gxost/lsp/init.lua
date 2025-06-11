local _lsps = {
    "luals",
    "clangd"
}

local function add_lsp(module_name)
    local l = req(module_name)
    vim.lsp.config[l.name] = l.opts
    vim.lsp.enable(l.name)
end

local function add_lsps(lsps)
    for k, v in ipairs(lsps) do
        add_lsp(v)
    end
end

add_lsps(_lsps)
