local wilder = require("wilder")

wilder.setup({
    modes = { ":", "/", "?" },
})

wilder.set_option("renderer", wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme({
        highlights = {
            border = 'FloatBorder'
        },
        left = { " ", wilder.popupmenu_devicons() },
        border = { " ╭ 󰊠 ", "─", " おばけ╮ ",
            " │•", " │ ",
            " ╰", "─", "╯ " },
        reverse = 1,
    })
))
