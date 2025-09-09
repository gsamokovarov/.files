return {
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
          enable = true,
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
}