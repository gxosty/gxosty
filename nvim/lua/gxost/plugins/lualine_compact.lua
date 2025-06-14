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

lualine.setup {
  options = {
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { "NvimTree" },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      { minimal_mode, padding = { left = 1, right = 1 } },
    },
    lualine_b = {
      { 'branch', icon = '', padding = { left = 1, right = 1 } },
      { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } },
    },
    lualine_c = {
      { 'filename', path = 0, symbols = { modified = ' ●', readonly = ' ', unnamed = '[󰮘]' } },
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
            return '' -- X icon = no LSP
          end
          return ' ' .. table.concat(vim.tbl_map(function(c) return c.name end, clients), ',')
        end,
        padding = { left = 1, right = 1 },
      },
    },
    lualine_y = {
      {'filetype', padding = { left = 1, right = 1 } },
    },
    lualine_z = {
      {'location', padding = { left = 1, right = 1 } },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = { 'progress' }
  },
  extensions = {}
}

