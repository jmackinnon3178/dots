return {

  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    float = {
      max_height = 20,
      max_width = 60,
    },
  },
  vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' }),
  vim.keymap.set('n', '<C-p>', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' }),
}
