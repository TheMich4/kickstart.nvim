local options = {}

options.base46 = {
  theme = 'tokyonight', -- default theme
  -- transparency = true,
}

options.ui = {
  cmp = {
    icons_left = true, -- only for non-atom styles!
    lspkind_text = true,
    style = 'atom_colored', -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = true, -- will work for css lsp too
      icon = '󱓻',
    },
  },

  colorify = {
    enabled = true,
    mode = 'virtual', -- fg, bg, virtual
    virt_text = '󱓻 ',
    highlight = { hex = true, lspvars = true },
  },

  mason = {
    pckgs = {},
  },

  statusline = {
    enabled = true,
    theme = 'minimal', -- default/vscode/vscode_colored/minimal
    separator_style = 'block', -- round/block
  },

  tabufline = {
    enabled = true,
    lazyload = true,
    order = { 'treeOffset', 'buffers', 'tabs' },
    modules = nil,
  },

  telescope = {
    style = 'bordered', -- bordered/borderless
  },
}

-- return options

local status, chadrc = pcall(require, 'chadrc')
return vim.tbl_deep_extend('force', options, status and chadrc or {})
