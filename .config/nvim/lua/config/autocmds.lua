-- Auto commands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- General autocmds group
local general = augroup('General', { clear = true })

-- Save the last position in a file
autocmd('BufReadPost', {
  group = general,
  pattern = '*',
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 1 and line <= vim.fn.line("$") then
      vim.cmd("normal! g'\"")
    end
  end,
})

-- Ruby and ERuby settings
autocmd('FileType', {
  group = general,
  pattern = { 'ruby', 'eruby' },
  callback = function()
    vim.opt_local.omnifunc = 'rubycomplete#Complete'
    vim.opt_local.iskeyword:append('?')
    vim.opt_local.iskeyword:append('!')
    -- Use the older RegExp engine as Ruby syntax is painfully slow with the current one
    vim.opt_local.regexpengine = 1
  end,
})

-- Go settings
autocmd('FileType', {
  group = general,
  pattern = 'go',
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- JavaScript, TypeScript settings
autocmd('FileType', {
  group = general,
  pattern = { 'javascript', 'typescript', 'typescriptreact', 'typescript.tsx', 'jsx', 'tsx' },
  callback = function()
    vim.b.closer = 1
    vim.b.closer_flags = '([{'
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.regexpengine = 0
  end,
})

-- CoffeeScript settings
autocmd('FileType', {
  group = general,
  pattern = 'coffee',
  callback = function()
    vim.opt_local.omnifunc = 'coffeecomplete#Complete'
  end,
})

-- Ego template files
autocmd({ 'BufRead', 'BufNewFile' }, {
  group = general,
  pattern = '*.ego',
  callback = function()
    vim.bo.filetype = 'html'
  end,
})

-- HTML settings
autocmd('FileType', {
  group = general,
  pattern = 'html',
  callback = function()
    vim.opt_local.omnifunc = 'htmlcomplete#Complete'
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- CSS settings
autocmd('FileType', {
  group = general,
  pattern = 'css',
  callback = function()
    vim.opt_local.omnifunc = 'csscomplete#Complete'
  end,
})

-- Markdown settings
autocmd('FileType', {
  group = general,
  pattern = 'markdown',
  callback = function()
    vim.keymap.set('n', '=', 'yypVr=', { buffer = true })
    vim.keymap.set('n', '-', 'yypVr-', { buffer = true })
  end,
})

-- Automatically rebalance windows on Vim resize
autocmd('VimResized', {
  group = general,
  pattern = '*',
  command = 'wincmd =',
})

-- Command abbreviations for Bulgarian layout and common typos
local abbrevs = augroup('Abbreviations', { clear = true })
autocmd('CmdwinEnter', {
  group = abbrevs,
  pattern = ':',
  callback = function()
    -- Bulgarian layout mappings
    vim.cmd('cnoreabbrev в w')
    vim.cmd('cnoreabbrev В w')
    vim.cmd('cnoreabbrev я q')
    vim.cmd('cnoreabbrev яа qa')
    vim.cmd('cnoreabbrev яал qal')
    vim.cmd('cnoreabbrev яалл qall')

    -- Common typos
    vim.cmd('cnoreabbrev W w')
    vim.cmd('cnoreabbrev Q q')
    vim.cmd('cnoreabbrev Wq wq')

    -- Git command shortcuts
    vim.cmd('cnoreabbrev Gco Git commit')
    vim.cmd('cnoreabbrev Gblame Git blame')
    vim.cmd('cnoreabbrev Gst Git')
  end,
})

-- Write using sudo command
vim.cmd('cnoremap w!! w !sudo tee % >/dev/null')

-- Insert mode abbreviations
vim.cmd('inoreabbrev inititalize initialize')

-- Plugin-specific autocmds are now defined in their respective plugin configurations
