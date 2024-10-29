return {
  {
    'rcarriga/nvim-notify',
    dependencies = {
      { 'nvim-telescope/telescope.nvim' },
    },
    config = function()
      require('notify').setup {
        background_colour = 'NotifyBackground',
        fps = 120,
        icons = {
          DEBUG = '',
          ERROR = '',
          INFO = '',
          TRACE = '✎',
          WARN = '',
        },
        level = 2,
        minimum_width = 50,
        render = 'compact',
        stages = 'fade_in_slide_out',
        time_formats = {
          notification = '%T',
          notification_history = '%FT%T',
        },
        timeout = 3000,
        top_down = false,
      }

      vim.keymap.set('n', '<leader>sN', function()
        require('telescope').extensions.notify.notify()
      end, { desc = '[S]earch [N]otifications' })
      vim.keymap.set('n', '<leader>nd', function()
        require('notify').dismiss { pending = true, silent = true }
      end, { desc = '[N]otification [D]ismiss All' })
    end,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup {
        lsp = {
          signature = {
            enabled = false,
          },
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }
    end,
  },
}
