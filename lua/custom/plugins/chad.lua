vim.keymap.set('n', '<leader>nt', function()
  require('nvchad.themes').open { style = 'compact' }
end, { desc = '[N]v [T]heme Toggle' })

vim.keymap.set('n', '<leader>nc', function()
  require('minty.huefy').open()
end, { desc = '[N]v [C]olor Picker' })

vim.keymap.set('n', '<leader>ns', function()
  require('minty.shades').open()
end, { desc = '[N]v Color [S]hades' })

return {
  {
    'nvchad/ui',
    config = function()
      require 'nvchad'
    end,
  },

  {
    'nvchad/base46',
    lazy = true,
    build = function()
      require('base46').load_all_highlights()
    end,
  },

  {
    'nvchad/volt',
    lazy = true,
  },
  {
    'nvchad/minty',
    lazy = true,
  },
}
