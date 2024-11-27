return {
  {
    'MunifTanjim/nui.nvim',
    lazy = true,
  },
  {
    'OlegGulevskyy/better-ts-errors.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    config = {
      keymaps = {
        toggle = '<leader>dd', -- default '<leader>dd'
        go_to_definition = '<leader>dx', -- default '<leader>dx'
      },
    },
  },

  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
    config = function()
      require('typescript-tools').setup {
        settings = {
          -- code_lens = 'all',
          tsserver_locale = 'en', -- default 'en', can be 'pl'

          tsserver_file_preferences = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeCompletionsForModuleExports = true,
          },
        },
      }
    end,

    vim.keymap.set('n', '<leader>Tf', '<cmd>TSToolsFixAll<cr>', { desc = '[T]ypescript [F]ix All' }),
    vim.keymap.set('n', '<leader>Ti', '<cmd>TSToolsAddMissingImports<cr>', { desc = '[T]ypescript Add [I]mports' }),
    vim.keymap.set('n', '<leader>Tr', '<cmd>TSRemoveUnused<cr>', { desc = '[T]ypescript [R]emove Unused' }),
  },

  {
    'dmmulroy/ts-error-translator.nvim',
    config = function()
      require('ts-error-translator').setup()
    end,
  },
}
