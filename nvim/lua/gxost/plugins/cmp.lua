local cmp = require("cmp")
cmp.setup {
    sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" }
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Esc>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.confirm({ select = false })
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                buffer = "[Buffer]",
                path = "[Path]"
            })[entry.source.name]
            return vim_item
        end
    }
}

CMP_CAPABILITIES = require("cmp_nvim_lsp").default_capabilities()
