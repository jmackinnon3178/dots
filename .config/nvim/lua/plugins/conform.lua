return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    local config = require 'conform'
    config.setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform will run multiple formatters sequentially
        python = { 'black' },
        -- Use a sub-list to run only the first available formatter
        javascript = { 'prettier' },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
    }
  end,
}
