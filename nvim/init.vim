" General settings

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set relativenumber
set cursorline
set scrolloff=8
set nowrap
set noshowmode

" Plugins

call plug#begin()

Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'MeanderingProgrammer/render-markdown.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.8'}
Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'numToStr/Comment.nvim'
Plug 'folke/which-key.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mfussenegger/nvim-lint'
Plug 'mhartington/formatter.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'tpope/vim-abolish'
Plug 'RRethy/vim-illuminate'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'rcarriga/nvim-notify'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
endfunction

Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }

" Theme plugins
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'folke/tokyonight.nvim'
Plug 'loctvl842/monokai-pro.nvim'
Plug 'xiyaowong/transparent.nvim'
Plug 'sphamba/smear-cursor.nvim'
Plug 'karb94/neoscroll.nvim'

call plug#end()

" Theme configuration
lua require("tokyonight").setup { transparent = vim.g.transparent_enabled }
lua require("transparent").setup()
lua require("smear_cursor").enabled = true

lua << EOF
    local transparent = require("transparent")
    transparent.clear_prefix("NvimTree")
    transparent.clear_prefix("ToggleTerm")

    require("monokai-pro").setup {
        filter = "octagon",
        background_clear = {"telescope"}
    }

    local neoscroll = require("neoscroll").setup {
        mappings = {
            -- "<C-k>", "<C-j>",
            -- "<C-h>", "<C-l>",
            -- "<C-y>", "<C-b>",
            -- "zt", "zz", "zb"
        },
        duration_multiplier = .5,
        performance_mode = false,
        easing = "quintic"
    }

    local keymaps = {
        ["<C-u>"] = function() require("neoscroll").ctrl_u({ duration = 250 }) end;
        ["<C-d>"] = function() require("neoscroll").ctrl_d({ duration = 250 }) end;
        ["<C-h>"] = function() require("neoscroll").ctrl_b({ duration = 450 }) end;
        ["<C-l>"] = function() require("neoscroll").ctrl_f({ duration = 450 }) end;
        ["<C-k>"] = function() require("neoscroll").scroll(-0.1, { move_cursor=true; duration = 100 }) end;
        ["<C-j>"] = function() require("neoscroll").scroll(0.1, { move_cursor=true; duration = 100 }) end;
        ["zt"]    = function() require("neoscroll").zt({ half_win_duration = 250 }) end;
        ["zz"]    = function() require("neoscroll").zz({ half_win_duration = 250 }) end;
        ["zb"]    = function() require("neoscroll").zb({ half_win_duration = 250 }) end;
    }

    local modes = { 'n', 'v', 'x' }
    for key, func in pairs(keymaps) do
        vim.keymap.set(modes, key, func)
    end
EOF

colorscheme monokai-pro

" Plugin configurations
lua require("mason").setup()
lua require("mason-lspconfig").setup()
lua require("nvim-autopairs").setup {}
lua require("lualine").setup()
lua require("Comment").setup()
lua require("nvim-web-devicons").setup()
lua require("nvim-tree").setup()
lua require("colorizer").setup()
lua vim.notify = require("notify")

call wilder#setup({'modes': [':', '/', '?']})

lua require("toggleterm").setup({open_mapping = [[<c-\>]]})

""" null-ls
lua << EOF
    local null_ls = require("null-ls")
    null_ls.setup({
        sources = {
            null_ls.builtins.diagnostics.ruff
        }
    })
EOF

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
                require("formatter.filetypes.python").ruff
            }
        }
    }
EOF

lua << EOF
    require("telescope").setup {
        defaults = {
            -- borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" }
        }
    }
EOF

" Keymaps
let mapleader = " "

""" Switch between windows
nnoremap <silent> <leader>ww <C-w>w
nnoremap <silent> <leader>wW <C-w>W

""" Selection
nnoremap <silent> <leader>ss ggVG
nnoremap <silent> <leader>sw viw

""" Format buffer
nnoremap <silent> <leader>f :Format<CR>

""" Telescope
nnoremap <silent> <leader>tb :Telescope buffers<CR>
nnoremap <silent> <leader>tf :Telescope find_files<CR>

""" Side-Panel
nnoremap <silent> <leader>bb :NvimTreeToggle<CR>

""" Coc auto-complete
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <Esc> coc#pum#visible() ? coc#pum#cancel() : "\<Esc>"
