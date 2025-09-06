return {
  -- Git integration
  {
    "airblade/vim-gitgutter",
    branch = "main",
    config = function()
      -- Trade speed for accuracy
      vim.g.gitgutter_realtime = 0
      vim.g.gitgutter_eager = 0
      vim.g.gitgutter_override_sign_column_highlight = 0

      vim.g.gitgutter_sign_added = '┃'
      vim.g.gitgutter_sign_modified = '┃'
      vim.g.gitgutter_sign_removed = '_'
      vim.g.gitgutter_sign_removed_first_line = '‾'
      vim.g.gitgutter_sign_removed_above_and_below = '~'
      vim.g.gitgutter_sign_modified_removed = '┆'
    end,
  },
}
