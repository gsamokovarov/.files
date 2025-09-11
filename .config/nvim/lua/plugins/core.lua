return {
  -- Split/join and switch utilities
  {
    "AndrewRadev/splitjoin.vim",
    config = function()
      -- Clear the default splitjoin mappings
      vim.g.splitjoin_split_mapping = ''
      vim.g.splitjoin_join_mapping = ''

      -- Custom splitjoin keymaps
      vim.keymap.set('n', '_', '<Cmd>SplitjoinJoin<CR>', { noremap = true })
      vim.keymap.set('n', '+', '<Cmd>SplitjoinSplit<CR>', { noremap = true })
    end,
    lazy = false,
  },

  {
    "AndrewRadev/switch.vim",
    config = function()
      -- Switch keymap
      vim.keymap.set('n', '-', '<Cmd>Switch<CR>', { noremap = true })
    end,
    lazy = false,
  },

  -- File line jumping
  {
    "bogado/file-line",
    branch = "main",
    lazy = false,
  },

  -- Close tags automatically
  {
    "alvan/vim-closetag",
    ft = { "html", "eruby", "xhtml", "phtml" },
    config = function()
      vim.g.closetag_filenames = '*.html,*.html.erb,*.xhtml,*.phtml'
    end,
  },

  -- Multiple cursors
  {
    "terryma/vim-multiple-cursors",
    lazy = false,
  },

  -- Auto closer
  {
    "rstacruz/vim-closer",
    lazy = false,
  },

  -- GitHub Copilot
  {
    "github/copilot.vim",
    branch = "release",
    lazy = false,
  },

  -- Disable noice
  {
    "folke/noice.nvim",
    enabled = false,
  },
}