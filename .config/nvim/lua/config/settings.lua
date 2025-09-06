-- Setup
vim.cmd("syntax on")
vim.opt.compatible = false
vim.cmd("filetype plugin indent on")

-- Load local vimrc if exists
local local_vimrc = vim.fn.expand("~/.vimrc.local")
if vim.fn.filereadable(local_vimrc) == 1 then
  vim.cmd("source " .. local_vimrc)
end

-- Builtin Settings
-- Enforce UTF-8 to reduce my WTF's per minute
vim.opt.encoding = "utf-8"

-- Keep backup files in ~/.vim/backup
vim.opt.backupdir = vim.fn.expand("$HOME/.vim/backup")

-- Keep undo files in ~/.vim/undo
vim.opt.undodir = vim.fn.expand("$HOME/.vim/undo")
vim.opt.undofile = true

-- Save view files in ~/.vim/view
vim.opt.viewdir = vim.fn.expand("$HOME/.vim/view")
vim.opt.viewoptions = "folds,cursor"

-- Keep swap files in ~/.vim/swap
vim.opt.directory = vim.fn.expand("$HOME/.vim/swap")

-- I name my tags file .tags as I don't like them listed by ls and the like
vim.opt.tags:append(".tags")
vim.opt.tags:append(".git/tags")

-- Watch for file changes
vim.opt.autoread = true

-- Don't wrap long lines
vim.opt.wrap = false

-- Don't display the current Vim mode
vim.opt.showmode = false

-- Automatically write buffers. Save keystrokes.
vim.opt.autowrite = true

-- Don't display any numbers, I have the current one in the airline status bar
-- anyway. Although the relative numbers are nice, they waste CPU and you can
-- really tell that on OSX.
vim.opt.relativenumber = false
vim.opt.number = false

-- Show the current line and character position in the command bar
vim.opt.ruler = true

-- Don't show the status bar. Strive for minimalism!
vim.opt.laststatus = 0
vim.opt.showmode = false

-- Don't show a tab bar. It is wasting real estate.
vim.opt.showtabline = 0

-- Don't redraw while executing commands from macros and registers
vim.opt.lazyredraw = true
vim.opt.ttyfast = true

-- This is the time in milliseconds that is waited for a key code or mapped key
-- sequence to complete. By default its a 1000, lower it a bunch. This speeds
-- up the exit of insert mode.
--
-- Note that this is also the timeout between multi stroke commands. yo or
-- <leader>5 will appear not working if I can't type them in the timeout.
-- Setting notimeout fixes the timeout for mappings.
vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 10

-- Highlight the search term while still typing it
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Ignore the case when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Read Vim file specific options
vim.opt.modeline = true

-- Start scrolling when you reach four lines before the end of the screen
-- Helps with the neck pain
vim.opt.scrolloff = 4

-- Just indent manually with zf
vim.opt.foldmethod = "manual"

-- Turn the spell check on by default
vim.opt.spell = true

-- Make split behave
vim.opt.splitbelow = true

-- Show trailing whitespace as ·
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·" }

-- Copy to the clipboard too
vim.opt.clipboard:append("unnamedplus")

-- Set backspace explicitly and include start and eol for delimitMate
-- compatibility. Removing indentation with backspace is pretty handy as well.
vim.opt.backspace = "indent,start,eol"

-- Don't hilight the 80th (or any) column as an unobtrusive reminder
vim.opt.colorcolumn = "0"

-- Syntax highlight only the first 512 characters
vim.opt.synmaxcol = 512

-- Don't match any pair characters. Wastes CPU redrawing the screen.
vim.opt.matchpairs = ""

-- Enable the mouse support if Vim supports it
if vim.fn.has("mouse") == 1 then
  vim.opt.mouse = "a"

  -- Neovim, for example, doesn't have it
  if vim.fn.has("ttymouse") == 1 then
    -- Force dragging support with the mouse
    vim.opt.ttymouse = "xterm2"
  end
end

-- Make your keyboard actually do something while you are switched to Cyrillic
-- layout. Ripped off @StanAngeloff.
vim.opt.langmap = "чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю|,"

-- Widely ignore vim swapfiles, tilda backups, python bytecode, .git dirs and
-- node modules and vendor directories. Some plugins actually respect those.
vim.opt.wildignore:append("*.sw?")
vim.opt.wildignore:append("*.un")
vim.opt.wildignore:append("*~")
vim.opt.wildignore:append("*py?")
vim.opt.wildignore:append(".git")
vim.opt.wildignore:append("node_modules")

-- Don't ring any bells
vim.opt.visualbell = true
-- Note: t_vb doesn't exist in Neovim, visualbell is sufficient

-- Some plugins expect bash or zsh as their shells. Fish shell has a different
-- stderr redirection syntax and it may break stuff, like Syntastic, for
-- example.
vim.opt.shell = "/bin/bash"

if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --nocolor --ignore=vendor --ignore=node_modules --ignore=.bundle"
end

-- Syntax highlight shell scripts as per POSIX, not the original Bourne shell
-- which very few use.
vim.g.is_posix = 1

-- Use the system Ruby for the ftplugin shenanigans.
vim.g.ruby_path = "/usr/bin/ruby"

-- Enable true color support
vim.opt.termguicolors = true

-- Set the initial background theme
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = "1"

-- Disable netrw before any plugins load (required for neo-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
