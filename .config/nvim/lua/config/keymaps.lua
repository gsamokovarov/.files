-- Map the Leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set('', '<Space>', '<Nop>', { noremap = true, silent = true })

-- No random help screens, please
vim.keymap.set('n', '<F1>', '<NOP>', { noremap = true })

-- Filter Ex commands with <C-{P,N}>
vim.keymap.set('c', '<C-P>', '<Up>', { noremap = true })
vim.keymap.set('c', '<C-N>', '<Down>', { noremap = true })

-- MacVim command mappings (if applicable)
if vim.fn.has("gui_macvim") == 1 and vim.fn.has("gui_running") == 1 then
  local function map_cmd_tab(num)
    local cmd = num == 9 and ":tablast<CR>" or num .. "gt"
    vim.keymap.set('n', '<D-' .. num .. '>', cmd, { noremap = true })
    vim.keymap.set('i', '<D-' .. num .. '>', '<Esc>' .. cmd, { noremap = true })
  end

  map_cmd_tab(0)
  for i = 1, 9 do
    map_cmd_tab(i)
  end
end

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

-- Plugin-specific keymaps are now defined in their respective plugin configurations
