return {
  -- Test runner
  {
    "janko-m/vim-test",
    config = function()
      vim.g['test#strategy'] = 'neovim'

      -- Test runner keymaps
      vim.keymap.set('n', '<Leader>t', '<Cmd>TestFile<CR>', { noremap = true })
      vim.keymap.set('n', '<Leader>T', '<Cmd>TestNearest<CR>', { noremap = true })
    end,
  },
}