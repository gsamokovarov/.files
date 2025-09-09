-- Disable LazyVim's default LSP setup
return {
  -- Disable LazyVim's default LSP plugins
  {
    "neovim/nvim-lspconfig",
    enabled = false,
  },
  {
    "williamboman/mason.nvim",
    enabled = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = false,
  },
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
  },

  -- CoC for LSP and completion
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      -- CoC keymaps
      vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
      vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
      vim.keymap.set('n', 'gi', '<Plug>(coc-fix-current)', { silent = true })
      vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })
      vim.keymap.set('n', '<C-]>', '<Plug>(coc-definition)', { silent = true })
      vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)', {})

      -- Use K to show documentation in preview window
      vim.keymap.set('n', 'K', function()
        local cw = vim.fn.expand('<cword>')
        if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
          vim.api.nvim_command('h ' .. cw)
        elseif vim.api.nvim_eval('coc#rpc#ready()') then
          vim.fn.CocActionAsync('doHover')
        else
          vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
        end
      end, { noremap = true, silent = true })

      -- CoC completion mappings
      local function check_backspace()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
      end

      vim.keymap.set('i', '<TAB>', function()
        if vim.fn['coc#pum#visible']() ~= 0 then
          return vim.fn['coc#pum#next'](1)
        elseif check_backspace() then
          return "<Tab>"
        else
          return vim.fn['coc#refresh']()
        end
      end, { silent = true, expr = true })

      vim.keymap.set('i', '<S-TAB>', function()
        if vim.fn['coc#pum#visible']() ~= 0 then
          return vim.fn['coc#pum#prev'](1)
        else
          return "<C-h>"
        end
      end, { expr = true })

      -- Make <CR> to accept selected completion item or notify coc.nvim to format.
      vim.keymap.set('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<C-g>u\\<CR>\\<C-r>=coc#on_enter()\\<CR>"',
        { expr = true, silent = true })

      -- Use <c-space> to trigger completion
      if vim.fn.has('nvim') == 1 then
        vim.keymap.set('i', '<c-space>', 'coc#refresh()', { silent = true, expr = true })
      else
        vim.keymap.set('i', '<c-@>', 'coc#refresh()', { silent = true, expr = true })
      end

      -- CoC autocmds
      local coc_group = vim.api.nvim_create_augroup('CoC', { clear = true })
      vim.api.nvim_create_autocmd('CursorHold', {
        group = coc_group,
        pattern = '*',
        callback = function()
          vim.fn.CocActionAsync('highlight')
        end,
        desc = 'Highlight symbol under cursor on CursorHold'
      })
    end,
  },

  -- ALE for linting and fixing
  {
    "dense-analysis/ale",
    config = function()
      vim.g.ale_fixers = {
        json = {'prettier'},
        javascript = {'prettier'},
        typescript = {'prettier'},
        typescriptreact = {'prettier'},
        scss = {'stylelint'},
        css = {'stylelint'},
        ruby = {'rubocop'},
      }

      -- Run the project specific rubocop/standardrb version
      vim.g.ale_ruby_rubocop_executable = 'bundle'
      vim.g.ale_ruby_standardrb_executable = 'bundle'

      vim.g.ale_lint_on_text_changed = 'never'
      vim.g.ale_lint_on_insert_leave = 0
      vim.g.ale_lint_on_enter = 0

      vim.g.ale_fix_on_save = 1

      -- ALE keymaps
      vim.keymap.set('n', '<Leader>d', ':ALEDetail<CR>', { noremap = true })
    end,
  },
}
