-- themes
plug("catppuccin/nvim", nil, { as = "catppuccin" })
plug("folke/tokyonight.nvim")
plug("loctvl842/monokai-pro.nvim")

-- other plugins for visuals
-- plug("xiyaowong/transparent.nvim")
-- plug("sphamba/smear-cursor.nvim")
plug("karb94/neoscroll.nvim", "neoscroll")
plug("mawkler/modicator.nvim", plug_setup("modicator"))

-- set theme
plug(function() vim.cmd("colorscheme tokyonight-night") end)
