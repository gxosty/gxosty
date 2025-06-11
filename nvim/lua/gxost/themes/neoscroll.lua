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

