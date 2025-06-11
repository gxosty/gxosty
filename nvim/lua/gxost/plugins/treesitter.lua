require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "lua",
        "c",
        "cpp",
        "cmake",
        "rust",
        "python",
        "dart",
        "javascript",
        "html",
        "css"
    },

    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true
    }
})

