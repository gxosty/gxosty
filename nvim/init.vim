" General settings

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set relativenumber
set cursorline

" Plugins

call plug#begin()

Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.8'}
Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'numToStr/Comment.nvim'
Plug 'folke/which-key.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mfussenegger/nvim-lint'
Plug 'mhartington/formatter.nvim'
Plug 'nvim-tree/nvim-tree.lua'

" Theme plugins
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'folke/tokyonight.nvim'
Plug 'xiyaowong/transparent.nvim'

call plug#end()

" Plugin configurations
lua require("mason").setup()
lua require("nvim-autopairs").setup {}
lua require("lualine").setup()
lua require("Comment").setup()
lua require("nvim-web-devicons").setup()
lua require("nvim-tree").setup()
lua require("transparent").setup()

""" indent_blankline
lua << EOF
    ibl_indent = {
        char = "┆"
    }

    require("ibl").setup({indent=ibl_indent})
EOF

""" nvim-treesitter
lua << EOF
    require("nvim-treesitter.configs").setup({
        ensure_installed = {"c", "cpp", "python", "dart"},

        sync_install = false,
        auto_install = false,

        highlight = {
            enable = true
        }
    })
EOF

""" formatter
lua << EOF
    local util = require "formatter.util"

    local c_cpp_formatter = function()
        return {
            exe = "clang-format",
            args = {
                util.escape_path(util.get_current_buffer_file_path()),
               "--style", "webkit"
            },
            stdin = true
        }
    end

    require("formatter").setup {
        -- Enable or disable logging
        logging = true,
        -- Set the log level
        log_level = vim.log.levels.WARN,

        filetype = {
            c = {
                c_cpp_formatter    
            },
            cpp = {
                c_cpp_formatter
            },
            python = {
                require("formatter.filetypes.python").black
            }
        }
    }
EOF

" Theme configuration
lua require("tokyonight").setup { transparent = vim.g.transparent_enabled }
colorscheme tokyonight-night

lua << EOF
    local transparent = require("transparent")
    transparent.clear_prefix("NvimTree")
EOF

" function! SetBackgroundTransparent()
"     highlight Normal guibg=none
"     highlight NonText guibg=none
"     highlight Normal ctermbg=none
"     highlight NonText ctermbg=none
" endfunction
"
" call SetBackgroundTransparent()
"
" autocmd BufWinEnter,WinEnter * call SetBackgroundTransparent()



" Keymaps
let mapleader = " "

nnoremap <silent> <leader>ww <C-w>w
nnoremap <silent> <leader>wW <C-w>W
nnoremap <silent> <leader>f :Format<CR>
nnoremap <silent> <leader>tb :Telescope buffers<CR>
nnoremap <silent> <leader>tf :Telescope fd<CR>
nnoremap <silent> <leader>bb :NvimTreeToggle<CR>

inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <Esc> coc#pum#visible() ? coc#pum#cancel() : "\<Esc>"
