vim.keymap.set('n', 'tt', ':NvimTreeToggle<cr>', { desc = '[T]oggle [T]ree' })

-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'github/copilot.vim',
  'ThePrimeagen/harpoon',
  -- {
  --   'nvim-tree/nvim-tree.lua',
  --   version = '*',
  --   lazy = false,
  --   dependencies = {
  --     'nvim-tree/nvim-web-devicons',
  --   },
  --   config = function()
  --     require('nvim-tree').setup {
  --       view = {
  --         width = 45,
  --       },
  --     }
  --   end,
  -- },
}
