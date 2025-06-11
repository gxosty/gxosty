-- """ Selection
-- nnoremap <silent> <leader>ss ggVG
-- nnoremap <silent> <leader>sw viw
-- 
-- """ Format buffer
-- nnoremap <silent> <leader>f :Format<CR>
-- 
-- """ Telescope
-- nnoremap <silent> <leader>tb :Telescope buffers<CR>
-- nnoremap <silent> <leader>tf :Telescope find_files<CR>
-- 
-- """ Side-Panel
-- nnoremap <silent> <leader>bb :Neotree toggle<CR>
-- 
-- """ Move line
-- nnoremap <silent> <A-j> :MoveLine(1)<CR>
-- nnoremap <silent> <A-k> :MoveLine(-1)<CR>
-- vnoremap <silent> <A-j> :MoveBlock(1)<CR>
-- vnoremap <silent> <A-k> :MoveBlock(-1)<CR>

vim.g.mapleader = " "

-- helper functions

local function nsetn(key, command)
    vim.keymap.set("n", key, command, { noremap = true, silent = true })
end

local function vsetn(key, command)
    vim.keymap.set("v", key, command, { noremap = true, silent = true })
end

-- keymaps

--- window switch
nsetn("<leader>w", "<C-w>w")
nsetn("<leader>q", "<C-w>W")

--- side panel
nsetn("<leader>e", ":NvimTreeToggle<CR>")

--- selection
nsetn("<leader>ss", "ss ggVG")
nsetn("<leader>sw", "viw")

--- format buffer
nsetn("<loader>f", ":Format<CR>")

--- telescope
nsetn("<leader>tb", ":Telescope buffers<CR>")
nsetn("<leader>tf", ":Telescope find_files<CR>")

--- buffer format
nsetn("<leader>f", ":lua vim.lsp.buf.format({ async = true })<CR>")
