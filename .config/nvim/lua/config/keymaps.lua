-- No random help screens, please
vim.keymap.set('n', '<F1>', '<NOP>', { noremap = true })

-- Filter Ex commands with <C-{P,N}>
vim.keymap.set('c', '<C-P>', '<Up>', { noremap = true })
vim.keymap.set('c', '<C-N>', '<Down>', { noremap = true })

-- Center the screen when going back
vim.keymap.set('n', '<C-O>', '<C-O>zz', { noremap = true })

-- Keep search matches in the middle of the window
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true })

-- Navigate through windows with Tab and Shift-Tab
vim.keymap.set('n', '<Tab>', '<C-w><C-w>', { noremap = true })
vim.keymap.set('n', '<S-Tab>', '<C-w><C-W>', { noremap = true })

-- Go to the m marked spot
vim.keymap.set('n', '``', '`mzz', { noremap = true })

-- Format the current paragraph
vim.keymap.set('n', '=', 'mmVap=`m', { noremap = true })

-- Format a paragraph to fit in textwidth
vim.keymap.set('n', '<Leader>f', 'gqap', { noremap = true })
vim.keymap.set('v', '<Leader>f', 'gq', { noremap = true })

-- Those seems friendlier to type than g{t,T}
vim.keymap.set('n', '<C-K>', 'gt', { noremap = true })
vim.keymap.set('n', '<C-J>', 'gT', { noremap = true })

-- Close current buffer with Q
vim.keymap.set('n', 'Q', '<Cmd>q<CR>', { noremap = true })
