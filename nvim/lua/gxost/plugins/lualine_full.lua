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

-- Function to display minimal mode
local function minimal_mode()
  local mode_code = vim.api.nvim_get_mode().mode
  return mode_map[mode_code] or '🅧'
end

local function mode_with_ghost()
  local mode_code = vim.api.nvim_get_mode().mode
  local mode_icon = mode_map[mode_code] or '🅧'
  return '󰊠 ' .. mode_icon
end

lualine.setup {
  options = {
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { "NvimTree" },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      { mode_with_ghost, padding = { left = 1, right = 1 }, separator = { left = '', right = '' } },
      { 'filename', path = 0, symbols = { modified = ' ●', readonly = ' ', unnamed = '<noname>' }, separator = { left = '', right = '' } },
    },
    lualine_b = {
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
    },
    lualine_y = {
    },
    lualine_z = {
      {'filetype', padding = { left = 1, right = 1 }, separator = { left = '' } },
      {'progress', separator = '', padding = { left = 2, right = 2 } },
      {'location', padding = { left = 1, right = 1 }, separator = { right = '' } },
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

