return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  config = function()
    require('lualine').setup {
      options = {
        theme = 'auto',
        component_separators = '|',
        -- section_separators = '',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { 'mode', separator = { right = '' }, right_padding = 2 } },
        lualine_b = { { 'filename', separator = { right = '' }, right_padding = 2 } },
        lualine_c = { { 'branch', separator = { right = '' }, right_padding = 2 } },
        lualine_x = { { 'diagnostics', separator = { left = '' }, left_padding = 2 } },
        lualine_y = { { 'filetype', separator = { left = '' }, left_padding = 2 } },
        lualine_z = { { 'location', separator = { left = '' }, left_padding = 2 } },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    }
  end,
}

-- opts = {
--   options = {
--     transparent = true,
--     icons_enabled = false,
--     theme = 'auto',
--     component_separators = '|',
--     section_separators = '',
--   },
-- },
