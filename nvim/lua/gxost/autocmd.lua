vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*",
    callback = function()
        if GXOST_HIDE_CMDLINE then
            mode = vim.api.nvim_get_mode()
            if mode.mode == "c" then
                vim.opt.cmdheight = 1
            end

            if mode.mode ~= "c" then
                vim.opt.cmdheight = 0
            end
        end
    end
})
