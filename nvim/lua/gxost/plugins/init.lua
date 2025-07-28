-- arg1: the plugin need to be loaded
-- arg2: the module need to be required (relative path)

-- alpha-nvim greeter
plug("goolord/alpha-nvim", "alpha")

-- lualine
if GXOST_LUALINE == "full" then
    plug("nvim-lualine/lualine.nvim", "lualine_full")
else
    plug("nvim-lualine/lualine.nvim", "lualine_compact")
end

-- treesitter
plug("nvim-treesitter/nvim-treesitter")
plug("nvim-treesitter/nvim-treesitter-textobjects")
plug("nvim-treesitter/nvim-treesitter-context", "treesitter")

-- autopairs
plug("windwp/nvim-autopairs", plug_setup("nvim-autopairs"))

-- plenary (for telescope)
plug("nvim-lua/plenary.nvim")

-- telescope
plug("nvim-telescope/telescope.nvim")

-- which key
plug("folke/which-key.nvim", "whichkey")

-- web devicons
plug("nvim-tree/nvim-web-devicons", plug_setup("nvim-web-devicons"))

-- nvim tree
plug("nvim-tree/nvim-tree.lua", plug_setup("nvim-tree"))
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- mason
plug("williamboman/mason.nvim", plug_setup("mason"))

-- toggleterm
plug("akinsho/toggleterm.nvim", "toggleterm")

-- inline diagnostics
plug("rachartier/tiny-inline-diagnostic.nvim", "inline_diagnostic")

-- wilder
plug("gelguy/wilder.nvim", 'wilder')

-- nvim-cmp autocompletion
plug('hrsh7th/cmp-nvim-lsp')
plug('hrsh7th/cmp-buffer')
plug('hrsh7th/cmp-path')
plug('hrsh7th/cmp-cmdline')
plug("hrsh7th/nvim-cmp", "cmp")

-- blankline
plug("lukas-reineke/indent-blankline.nvim", "blankline")

-- notify
plug("rcarriga/nvim-notify", "notify")

-- render markdown
plug("MeanderingProgrammer/render-markdown.nvim")

-- subvert
plug("tpope/vim-abolish")

-- autotag
plug("windwp/nvim-ts-autotag", plug_setup("nvim-ts-autotag"))
