return {
  -- Gruvbox is _always_ installed.
  { "ellisonleao/gruvbox.nvim", },

  -- See https://github.com/LazyVim/LazyVim/issues/6355.
  {
    "catppuccin/nvim",
    opts = {
      integrations = {
        bufferline = true,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = {},
      },
    },
  },
}
