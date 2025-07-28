vim.g.mapleader = " "

local wk = require("which-key")
wk.add({
    -- window switch
    { "<leader>w",  "<C-w>w",                    desc = "Switch to next window", },
    { "<leader>q",  "<C-w>W",                    desc = "Switch to previous window", },
    { "<leader>ä",  "<C-w>W",                    hidden = true, },

    -- side panel
    { "<leader>e",  ":NvimTreeToggle<CR>",       desc = "Toggle nvim-tree", },

    -- selection
    { "<leader>ss", "ggVG",                      desc = "Select all", },
    { "<leader>sw", "viw",                       desc = "Select word", },

    -- telescope
    { "<leader>tb", ":Telescope buffers<CR>",    desc = "Open buffers list", },
    { "<leader>tf", ":Telescope find_files<CR>", desc = "Find files", },

    -- buffer format
    { "<leader>f",  ":lua vim.lsp.buf.format({ async = true })<CR>", desc = "Format code", },

    -- os clipboard
    { "<leader>c",  '"+y',                       desc = "Copy to OS clipboard",      mode = "v", group = "OS clipboard" },
    { "<leader>x",  '"+d',                       desc = "Cut to OS clipboard",       mode = "v", group = "OS clipboard" }
})

--- other locale layout workaround
vim.keymap.set({ "n", "v" }, "ý", "v", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "Ý", "V", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "ç", "c", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "Ç", "C", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "ü", "x", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "Ü", "X", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "ä", "q", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "Ä", "Q", { noremap = true, silent = true })
