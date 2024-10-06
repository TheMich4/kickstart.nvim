vim.keymap.set('n', '<leader>nt', function()
  require('nvchad.themes').open { style = 'compact' }
end, { desc = '[N]v [T]heme Toggle' })

vim.keymap.set('n', '<leader>nc', function()
  require('minty.huefy').open()
end, { desc = '[N]v [C]olor Picker' })

vim.keymap.set('n', '<leader>ns', function()
  require('minty.shades').open()
end, { desc = '[N]v Color [S]hades' })

-- Tabs
vim.keymap.set('n', '<S-Tab>', function()
  require('nvchad.tabufline').prev()
end, { desc = 'Previous Tab' })

vim.keymap.set('n', '<Tab>', function()
  require('nvchad.tabufline').next()
end, { desc = 'Next Tab' })

vim.keymap.set('n', '<leader>bc', function()
  require('nvchad.tabufline').close_buffer()
end, { desc = '[B]uffer [C]lose' })

vim.keymap.set('n', '<leader>bq', function()
  require('nvchad.tabufline').closeAllBufs(true)
end, { desc = '[B]uffer [Q]uit All' })

vim.keymap.set('n', '<leader>br', function()
  require('nvchad.tabufline').move_buf(1)
end, { desc = '[B]uffer Move [R]ight' })

vim.keymap.set('n', '<leader>bl', function()
  require('nvchad.tabufline').move_buf(-1)
end, { desc = '[B]uffer Move [L]eft' })

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
