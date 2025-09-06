return {
  -- Colorschemes
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,
        contrast = "",
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })

      -- Set colorscheme
      vim.cmd('colorscheme gruvbox')

      -- Sign column styling
      vim.api.nvim_set_hl(0, 'SignColumn', { ctermbg = 'NONE', bg = 'NONE' })

      -- Hide the ~ characters on empty lines by setting EndOfBuffer highlight to bg color
      vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = vim.api.nvim_get_hl(0, { name = 'Normal' }).bg })
    end,
  },

  -- Color highlighting
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

}
