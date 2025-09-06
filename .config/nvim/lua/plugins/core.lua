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
  },

  {
    "AndrewRadev/switch.vim",
    config = function()
      -- Switch keymap
      vim.keymap.set('n', '-', '<Cmd>Switch<CR>', { noremap = true })
    end,
  },

  -- File line jumping
  {
    "bogado/file-line",
    branch = "main",
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
  },

  -- Auto closer
  {
    "rstacruz/vim-closer",
  },

  -- Gitignore syntax
  {
    "vim-scripts/gitignore",
  },

  -- GitHub Copilot
  {
    "github/copilot.vim",
    branch = "release",
  },
}
