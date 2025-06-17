-- themes
plug("catppuccin/nvim", nil, { as = "catppuccin" })
plug("folke/tokyonight.nvim")
plug("loctvl842/monokai-pro.nvim")
plug("rebelot/kanagawa.nvim")
plug("EdenEast/nightfox.nvim")
plug("sainnhe/everforest")
plug("rose-pine/neovim")
plug("projekt0n/github-nvim-theme")
plug("sainnhe/gruvbox-material")
plug("sainnhe/sonokai")
plug("navarasu/onedark.nvim")
plug("nyoom-engineering/oxocarbon.nvim")
plug("mhartington/oceanic-next")
plug("bluz71/vim-moonfly-colors")
plug("marko-cerovac/material.nvim")
plug("danilo-augusto/vim-afterglow")

-- other plugins for visuals
-- plug("xiyaowong/transparent.nvim")
-- plug("sphamba/smear-cursor.nvim")
plug("karb94/neoscroll.nvim", "neoscroll")
plug("mawkler/modicator.nvim", plug_setup("modicator"))

-- set theme
plug(function() vim.cmd("colorscheme " .. GXOST_THEME) end)
