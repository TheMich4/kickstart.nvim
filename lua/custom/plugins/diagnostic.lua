vim.diagnostic.config { virtual_text = false }

return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy', -- Or `LspAttach`
  priority = 1000, -- needs to be loaded in first
  config = function()
    require('tiny-inline-diagnostic').setup {
      signs = {
        diag = '󰄛 ',
      },
      options = {
        multiple_diag_under_cursor = false,
        multilines = true,
      },
    }
  end,
}
