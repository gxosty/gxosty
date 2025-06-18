local transparent = require("transparent")

transparent.setup {
    extra_groups = {
        "NormalBorder",
        "FloatBorder",
        "TinyInlineDiagnosticVirtualTextArrow",
        "TinyInlineDiagnosticVirtualTextBg",
    }
}

transparent.clear_prefix("NvimTree")
transparent.clear_prefix("Telescope")
transparent.clear_prefix("WhichKey")

vim.g.transparent_enabled = GXOST_TRANSPARENT
