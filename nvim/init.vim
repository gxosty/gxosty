" General settings

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set relativenumber
set cursorline
set scrolloff=8
set sidescrolloff=8
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
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mfussenegger/nvim-lint'
Plug 'mhartington/formatter.nvim'
" Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'tpope/vim-abolish'
Plug 'RRethy/vim-illuminate'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'rcarriga/nvim-notify'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'nanozuki/tabby.nvim'
Plug 'nkakouros-original/numbers.nvim'
Plug 'mcauley-penney/visual-whitespace.nvim'
Plug 'rlychrisg/truncateline.nvim'
Plug 'tris203/precognition.nvim'
Plug 'windwp/nvim-ts-autotag'
Plug 'andersevenrud/nvim_context_vt'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nacro90/numb.nvim'
Plug 'fedepujol/move.nvim'
Plug 'ray-x/lsp_signature.nvim'

" I may find this interesting
" Plug 'nosduco/remote-sshfs.nvim'

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
Plug 'mawkler/modicator.nvim'

call plug#end()

" Theme configuration
lua require("tokyonight").setup { transparent = vim.g.transparent_enabled }
lua require("transparent").setup()
lua require("modicator").setup()
" lua require("smear_cursor").setup {}

lua << EOF
    local transparent = require("transparent")
    -- transparent.clear_prefix("NvimTree")
    transparent.clear_prefix("NeoTreeNormal")
    transparent.clear_prefix("NeoTreeNormalNC")
    transparent.clear_prefix("NeoTreeEndOfBuffer")
    transparent.clear_prefix("NeoTreeWinSeparator")
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

colorscheme catppuccin-mocha

" Plugin configurations
call wilder#setup({'modes': [':', '/', '?']})
lua require("mason").setup()
lua require("mason-lspconfig").setup()
lua require("nvim-autopairs").setup {}
" lua require("lualine").setup({ options = { disabled_filetypes = { "NvimTree" } } } )
lua require("Comment").setup()
lua require("nvim-web-devicons").setup()
lua require("nvim-tree").setup()
lua require("colorizer").setup()
lua require("tabby").setup({})
lua require("numbers").setup()
lua require("visual-whitespace").setup()
" lua require("truncateline").setup({ enabled_on_start = true })
lua require("precognition").setup({ startVisible = false })
lua require("nvim-ts-autotag").setup()
lua require("toggleterm").setup({open_mapping = [[<c-\>]]})
lua require("nvim_context_vt").setup {}
lua require("numb").setup()
lua require("statusline")

""" nvim-cmp + lspconfig + lsp_signature
lua << EOF
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

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lsp = require("lspconfig")

    lsp.clangd.setup {
        capabilities = capabilities,
        cmd = {
            "clangd",
            -- "--clang-tidy",
            -- "--clang-tidy-checks=performance-*,bugprone-*",
            "--completion-style=detailed",
            "--compile-commands-dir=build"
        },
    }

    lsp.pyright.setup { capabilities = capabilities }
    lsp.lua_ls.setup { capabilities = capabilities }
    lsp.rust_analyzer.setup { capabilities = capabilities }

    local lsp_sig = require("lsp_signature")
    lsp_sig.setup {
        bind = true,
        floating_window = false,
        hint_enable = true,
        hint_prefix = "🔹 ",
        handler_opts = {
            border = "rounded"
        }
    }
EOF

""" notify
lua << EOF
    local n = require("notify")
    n.setup({
        background_colour = "#11111b"
    })
    vim.notify = n
EOF

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

""" telescope
lua << EOF
    require("telescope").setup {
        defaults = {
            -- borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" }
        }
    }
EOF

""" move
lua << EOF
    require('move').setup({
        line = {
            enable = true, -- Enables line movement
            indent = true  -- Toggles indentation
        },
        block = {
            enable = true, -- Enables block movement
            indent = true   -- Toggles indentation
        },
        word = {
            enable = false, -- Enables word movement
        },
        char = {
            enable = false -- Enables char movement
        }
    })

EOF

" Keymaps
let mapleader = " "

""" Cursor navigation in insert mode
inoremap <silent> <C-h> <Left>
inoremap <silent> <C-l> <Right>
inoremap <silent> <C-j> <Down>
inoremap <silent> <C-k> <Up>

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
nnoremap <silent> <leader>bb :Neotree toggle<CR>

""" Move line
nnoremap <silent> <A-j> :MoveLine(1)<CR>
nnoremap <silent> <A-k> :MoveLine(-1)<CR>
vnoremap <silent> <A-j> :MoveBlock(1)<CR>
vnoremap <silent> <A-k> :MoveBlock(-1)<CR>

""" Coc auto-complete
" inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" inoremap <silent><expr> <Esc> coc#pum#visible() ? coc#pum#cancel() : "\<Esc>"
