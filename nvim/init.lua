CONFIG_ROOT = "gxost"


-- lualine style: { "full", "compact" }
GXOST_LUALINE = "full"

-- colorscheme
GXOST_THEME = "monokai-pro-octagon"

-- enable background transparency
GXOST_TRANSPARENT = true


math.randomseed(os.time())
require("_helper")
require(CONFIG_ROOT)
