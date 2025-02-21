set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set relativenumber

call plug#begin()

" Plug 'williamboman/mason.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

Plug 'windwp/nvim-autopairs'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.8'}

Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'numToStr/Comment.nvim'
Plug 'folke/which-key.nvim'
Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }
Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

call plug#end()

" lua require("mason").setup()
lua require("nvim-autopairs").setup {}
lua require("lualine").setup()
lua require("Comment").setup()
lua require("nvim-web-devicons").setup()
" lua require('nvim-treesitter.configs').setup()

" set termguicolors
" lua require("bufferline").setup()

lua << EOF

ibl_indent = {
    char = "┆"
}

require("ibl").setup({indent=ibl_indent})

EOF

lua << EOF

require("nvim-treesitter.configs").setup({
    ensure_installed = {"c", "cpp", "python"},

    sync_install = false,
    auto_install = false,

    highlight = {
        enable = true
    }
})

EOF

colorscheme catppuccin
