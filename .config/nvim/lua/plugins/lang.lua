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
    end,
  },

  -- Sleuth for automatic indentation detection
  {
    "tpope/vim-sleuth",
    config = function()
      vim.g.sleuth_automatic = 1
    end,
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


  -- Ruby settings
  {
    "vim-ruby/vim-ruby",
    ft = "ruby",
    config = function()
      vim.g.ruby_minlines = 100
      vim.g.ruby_spellcheck_strings = 0
      vim.g.ruby_indent_end_alignment = "variable"
      vim.g.ruby_indent_block_style = 'do'
    end,
  },

  -- Markdown settings
  {
    "plasticboy/vim-markdown",
    ft = "markdown",
    config = function()
      vim.g.markdown_fenced_languages = {
        'coffee', 'css', 'eruby', 'javascript', 'ruby', 'html'
      }
    end,
  },
}

