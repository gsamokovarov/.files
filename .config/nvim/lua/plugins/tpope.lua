return {
  -- Tim Pope's essential plugins
  {
    "tpope/vim-commentary",
  },

  {
    "tpope/vim-endwise",
  },

  {
    "tpope/vim-fugitive",
  },

  {
    "tpope/vim-rails",
    config = function()
      -- Rails keymaps
      vim.keymap.set('n', '<Leader>rs', '<Cmd>RS<CR>', { noremap = true })
      vim.keymap.set('n', '<Leader>ra', '<Cmd>A<CR>', { noremap = true })
    end,
  },

  {
    "tpope/vim-repeat",
  },

  {
    "tpope/vim-surround",
  },

  {
    "tpope/vim-unimpaired",
  },
}