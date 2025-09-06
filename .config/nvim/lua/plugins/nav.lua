return {
  -- FZF for fuzzy finding
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require('fzf-lua')
      fzf.setup({
        -- Customize fzf colors to match gruvbox
        fzf_colors = {
          ['fg'] = { 'fg', 'Normal' },
          ['bg'] = { 'bg', 'Normal' },
          ['hl'] = { 'fg', 'Comment' },
          ['fg+'] = { 'fg', 'CursorLine', 'CursorColumn', 'Normal' },
          ['bg+'] = { 'bg', 'CursorLine', 'CursorColumn' },
          ['hl+'] = { 'fg', 'Statement' },
          ['info'] = { 'fg', 'PreProc' },
          ['border'] = { 'fg', 'Ignore' },
          ['prompt'] = { 'fg', 'Conditional' },
          ['pointer'] = { 'fg', 'Exception' },
          ['marker'] = { 'fg', 'Keyword' },
          ['spinner'] = { 'fg', 'Label' },
          ['header'] = { 'fg', 'Comment' }
        },
        files = {
          prompt = ">> ",
          cmd = "rg --files --hidden --glob '!.git'",
        },
        buffers = {
          prompt = "Buffers❯ ",
        },
        grep = {
          prompt = "Rg❯ ",
        }
      })

      -- FZF keymaps
      vim.keymap.set('n', '<Leader><Space>', '<Cmd>lua require("fzf-lua").files()<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<Leader>,', '<Cmd>lua require("fzf-lua").buffers()<CR>', { noremap = true, silent = true })
    end,
  },

  -- Original FZF (keeping for compatibility)
  {
    "junegunn/fzf",
    build = "./install --bin",
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    config = function()
      -- FZF settings (keeping original functionality)
      vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob \\!.git'

      -- [Buffers] Jump to the existing window if possible
      vim.g.fzf_buffers_jump = 1

      -- [[B]Commits] Customize the options used by 'git log'
      vim.g.fzf_commits_log_options = '--graph --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

      -- [Tags] Command to generate tags file
      vim.g.fzf_tags_command = 'ctags -R'

      -- This is the default extra key bindings
      vim.g.fzf_action = {
        ['ctrl-t'] = 'tab split',
        ['ctrl-s'] = 'split',
        ['ctrl-v'] = 'vsplit'
      }
    end,
  },

  -- CtrlSF for search and replace
  {
    "dyng/ctrlsf.vim",
    config = function()
      -- Show results as a split to the bottom, not to the left
      vim.g.ctrlsf_position = 'bottom'

      -- CtrlSF keymaps
      vim.keymap.set('n', '<Leader>s', '<Plug>CtrlSFPrompt', {})
      vim.keymap.set('n', '<Leader>/', '<Plug>CtrlSFPrompt', {})
      vim.keymap.set('v', '<Leader>s', '<Plug>CtrlSFVwordPath', {})
    end,
  },

  -- Neo-tree for file exploration
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
      })

      -- Neo-tree keymap
      vim.keymap.set('n', '<Leader>e', '<Cmd>Neotree reveal toggle<CR>', { noremap = true, silent = true })
    end,
  },
}
