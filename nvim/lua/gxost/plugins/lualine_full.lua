-- require("lualine").setup({ options = { disabled_filetypes = { "NvimTree" } } } )

local lualine = require('lualine')

-- Custom symbols for modes
local mode_map = {
    ['n'] = 'n',
    ['no'] = 'N',
    ['v'] = 'v',
    ['V'] = 'V',
    [''] = 'V',
    ['i'] = 'i',
    ['ic'] = 'I',
    ['R'] = 'r',
    ['Rv'] = 'R',
    ['c'] = 'c',
    ['s'] = 's',
    ['S'] = 'S',
    ['t'] = 't',
}

local function mode_with_ghost()
    local mode_code = vim.api.nvim_get_mode().mode
    local mode_icon = mode_map[mode_code] or '🅧'
    return '󰊠 ' .. mode_icon
end

local function get_os_icon()
    local icons = {
        unix = '', -- Linux icon
        mac = '', -- Apple icon
        win = '', -- Windows icon
    }

    if vim.fn.has('mac') == 1 then
        return icons.mac
    elseif vim.fn.has('win32') == 1 then
        return icons.win
    else
        return icons.unix
    end
end

lualine.setup {
    options = {
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { "NvimTree" },
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            { mode_with_ghost, padding = { left = 1, right = 1 }, separator = { left = '', right = '' } },
        },
        lualine_b = {
            { 'filename', path = 0, symbols = { modified = ' ●', readonly = ' ', unnamed = '󰮘' }, separator = { left = '', right = '' } },
        },
        lualine_c = {
            { 'branch', icon = '', padding = { left = 1, right = 1 } },
            { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } },
        },
        lualine_x = {
            {
                'diagnostics',
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                colored = true,
                update_in_insert = false,
            },
            {
                function()
                    local clients = vim.lsp.get_clients({ bufnr = 0 })
                    if #clients == 0 then
                        return ' ' -- X icon = no LSP
                    end
                    return ' ' .. table.concat(vim.tbl_map(function(c) return c.name end, clients), ',')
                end,
                padding = { left = 1, right = 1 },
            },
            { 'encoding', padding = { left = 1, right = 1 } },
        },
        lualine_y = {
            { 'filetype', padding = { left = 1, right = 1 }, separator = { left = '' } },
            {
                get_os_icon,
                -- color = { fg = '#8be9fd' },
                padding = { left = 1, right = 2 }
            },
        },
        lualine_z = {
            { 'progress', separator = '', padding = { left = 2, right = 2 } },
            { 'location', padding = { left = 1, right = 1 }, separator = { right = '' } },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    extensions = {}
}
