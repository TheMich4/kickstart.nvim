return {
  {
    'm4xshen/hardtime.nvim',
    dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
    opts = {
      disabled_keys = {
        ['<Down>'] = {},
        ['<Up>'] = {},
        ['<Right>'] = {},
        ['<Left>'] = {},
      },
      disable_mouse = false,
      restriction_mode = 'hint',
    },
  },
}
