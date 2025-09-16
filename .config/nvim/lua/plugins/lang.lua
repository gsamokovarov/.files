return {
  -- Don't use nvim-treesitter-textobjects
  { "nvim-treesitter-textobjects", enabled = false },

  -- Treesitter for syntax highlighting and parsing
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash", "css", "go", "graphql", "html", "javascript", "json",
          "lua", "markdown", "ruby", "scss", "typescript", "vim", "yaml"
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = false,
        },
      })

      -- Treat eruby.yaml files as yaml for Treesitter
      vim.treesitter.language.register("yaml", "eruby.yaml")
    end,
  },

  -- Sleuth for automatic indentation detection
  {
    "tpope/vim-sleuth",
    lazy = false,
  },

  -- Go support
  {
    "fatih/vim-go",
    ft = "go",
    build = ":GoInstallBinaries",
    config = function()
      vim.g.go_highlight_functions = 1
      vim.g.go_highlight_methods = 1
      vim.g.go_highlight_fields = 1
      vim.g.go_highlight_types = 1
      vim.g.go_highlight_structs = 1
      vim.g.go_highlight_operators = 1
      vim.g.go_highlight_build_constraints = 1
      vim.g.go_fmt_fail_silently = 0
      vim.g.go_fmt_command = "goimports"
      vim.g.go_def_mapping_enabled = 0
      vim.g.go_def_mode = 'gopls'
      vim.g.go_info_mode = 'gopls'
    end,
  },

  -- GraphQL support
  {
    "jparise/vim-graphql",
  },

  -- Color highlighting
  {
    "norcalli/nvim-colorizer.lua",
    lazy = false,
    config = function()
      require("colorizer").setup()
    end,
  },

  -- Better rails support
  {
    "tpope/vim-rails",
    lazy = false,
    config = function()
      -- Rails keymaps
      vim.keymap.set('n', '<Leader>rs', '<Cmd>RS<CR>', { noremap = true })
      vim.keymap.set('n', '<Leader>ra', '<Cmd>A<CR>', { noremap = true })
    end,
  },
}
