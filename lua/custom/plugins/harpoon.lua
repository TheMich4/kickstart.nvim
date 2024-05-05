return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      harpoon:setup {}

      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      vim.keymap.set('n', '<leader>sH', function()
        toggle_telescope(harpoon:list())
      end, { desc = '[S]search [H]arpoon' })

      vim.keymap.set('n', '<C-a>', function()
        harpoon:list():add()
      end, { desc = '[H]]arpoon [A]dd' })

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-i>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-o>', function()
        harpoon:list():next()
      end)

      vim.keymap.set('n', '<leader>Hc', function()
        harpoon:list():clear()
      end, { desc = '[H]arpoon [C]lear' })
    end,
  },
}
