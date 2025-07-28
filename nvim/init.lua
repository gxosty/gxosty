CONFIG_ROOT = "gxost"


-- lualine style: { "full", "compact" }
GXOST_LUALINE = "full"

-- colorscheme
-- GXOST_THEME = "monokai-pro-octagon"
GXOST_THEME = "tokyonight-night"

-- enable background transparency
GXOST_TRANSPARENT = false

-- hide cmdline
GXOST_HIDE_CMDLINE = false


math.randomseed(os.time())
require("_helper")
require(CONFIG_ROOT)
