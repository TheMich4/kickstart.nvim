return {
  'https://gitlab.com/schrieveslaach/sonarlint.nvim',
  -- branch = 'connected-mode',
  dependencies = {
    'neovim/nvim-lspconfig', -- this is my stuff so you can just put nvim-lspconfig as dep
  },
  opts = function()
    local sonarlint = {
      rules = {
        ['typescript:S3776'] = { level = 'on' },
      },

      -- connectedMode = {
      --   project = {
      --     projectKey = '',
      --     connectionId = '',
      --   },
      --   connections = {
      --     sonarqube = {
      --       {
      --         connectionId = '',
      --         serverUrl = '',
      --         token = '',
      --       },
      --     },
      --   },
      -- },
    }
    local install_root_dir = vim.fn.stdpath 'data' .. '/mason'

    --- @type string
    local pathToNodeExecutable = vim.fn.exepath 'node'

    if type(pathToNodeExecutable) ~= 'string' or pathToNodeExecutable == '' then
      vim.notify(string.format("pathToNodeExecutable '%s' is not valid", pathToNodeExecutable), vim.log.levels.WARN, {
        stuff = pathToNodeExecutable,
      })
    else
      sonarlint.pathToNodeExecutable = pathToNodeExecutable
    end

    return {
      server = {
        cmd = {
          -- vim.fn.expand('$MASON/bin/sonarlint-language-server'),
          'sonarlint-language-server',
          -- Ensure that sonarlint-language-server uses stdio channel
          '-stdio',
          '-analyzers',
          -- paths to the analyzers you need, using those for python and java in this example
          install_root_dir .. '/share/sonarlint-analyzers/sonarpython.jar',
          install_root_dir .. '/share/sonarlint-analyzers/sonarcfamily.jar',
          install_root_dir .. '/share/sonarlint-analyzers/sonarjava.jar',
          install_root_dir .. '/share/sonarlint-analyzers/sonarjs.jar',
        },
        settings = {
          sonarlint = sonarlint,
        },
      },
      filetypes = {
        -- Tested and working
        'python',
        'cpp',
        'typescriptreact',
        'typescript',
        -- Requires nvim-jdtls, otherwise an error message will be printed
        -- 'java',
      },
    }
  end,
}
