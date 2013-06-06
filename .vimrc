" Setup
" -----

syntax on
set nocompatible

filetype off

call pathogen#runtime_append_all_bundles()

set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

" Bundles
" -------

Bundle 'AndrewRadev/inline_edit.vim'
Bundle 'AndrewRadev/multichange.vim'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'SirVer/ultisnips'
Bundle 'airblade/vim-gitgutter'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ciaranm/detectindent'
Bundle 'dbext.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'ervandew/supertab'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'guns/vim-clojure-static'
Bundle 'jesseschalken/list-text-object'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'koron/nyancat-vim'
Bundle 'majutsushi/tagbar'
Bundle 'matchit.zip'
Bundle 'mileszs/ack.vim'
Bundle 'mintplant/vim-literate-coffeescript.git'
Bundle 'pangloss/vim-javascript'
Bundle 'paredit.vim'
Bundle 'rodjek/vim-puppet'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sickill/vim-pasta'
Bundle 'sjl/gundo.vim'
Bundle 'slim-template/vim-slim'
Bundle 'timcharper/textile.vim'
Bundle 'tpope/vim-afterimage'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-tbone'
Bundle 'tpope/vim-unimpaired'
Bundle 'tristen/vim-sparkup'
Bundle 'vim-ruby/vim-ruby'

" Builtin Settings
" ----------------

filetype plugin indent on

" Keep the backup files in ~/.vim/backup.
set backupdir=$HOME/.vim/backup

" Keep the undp files in ~/.vim/undo.
set undodir=$HOME/.vim/undo

" Keep the swap files in ~/.vim/swap.
set directory=$HOME/.vim/swap

" Display the line numbers.
set number

" Don't wrap the long lines.
set nowrap

" Display the current Vim mode.
set showmode

" Display relative line numbers to the selected line.
set relativenumber

" Don't redraw while executing commands from macros and registers.
set lazyredraw
set ttyfast

" Highlight the search term.
set hlsearch

" Ignore the case when searching.
set ignorecase
set smartcase

" Read Vim file specific options.
set modeline

" Copy to the X clipboard too.
set clipboard+=unnamedplus

" Always complete the longest available first.
set completeopt+=longest

" Highlight the 80th column as an unobtrusive reminder.
set colorcolumn=80

" Syntax highlight only the first 512 characters.
set synmaxcol=512

" Enable the mouse support if Vim supports it.
if has('mouse')
  set mouse=a
endif

" Make you keyboard actually do something while you are switched to Cyrillic
" layout. Ripped off @StanAngeloff
set langmap+=чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю\|,

" Widely ignore vim swapfiles, tilda backups, python bytecode, .git dirs and
" node modules. Some plugins actually respect those.
set wildignore+=*.sw?,*.un~*~,*py?,.git,node_modules

" Syntax highlight shell scripts as per POSIX, not the original Bourne shell
" which very few use.
let g:is_posix=1

" Plugin settings
" ---------------

" Tell detectindet to use one tab, if it is confused.
let g:detectindent_preferred_expandtab=1

" Ignore tilda editor leftovers and python junk in the NERDTree. Keep those as
" NERDTree seem not to respect wildignore
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '^.sass-cache$']

" Use a minimal UI for the NERDTree. No wasted space on 'Press ? for help'
" headers.
let NERDTreeMinimalUI=1

" Just use one NERDTree on all tabs and don't show it on startup.
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_open_on_new_tab=1

" Tell syntastic not to jump to errors and skip /c(++)?/ files.
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0

" Add some fancy symbols for the error and warning messages.
let g:syntastic_error_symbol='→'
let g:syntastic_warning_symbol='→'

" Show gundo on the right side of the screen.
let g:gundo_right=1

" Style settings
" --------------

" Use light background by default.
set background=light

" Style powerline for fancy symbols and the solarized theme.
let g:Powerline_symbols='fancy'
let g:Powerline_colorscheme='solarized256'

" Use 256 colors everywhere.
set t_Co=256

" I use gnome-terminal - its not slow, but its not fast either. Sometimes I
" need more snappier feel. The GUI one gives me that.
if has('gui_running')
  " Set the GUI solarized theme.
  colorscheme solarized

  " Set-up a powerline capable font.
  set guifont=Ubuntu\ Mono\ 15

  " If we are running in a gui like GVim, make sure to hide every annoying UI
  " piece. I don't like the GTK tabs, scrollbars and especially the toolbar.
  set guioptions=
else
  " Use light solarized theme on a transparent terminal. Its important to set
  " the termtrans before the colorscheme.
  let g:solarized_termtrans=1
  colorscheme solarized
endif

" Custom settings
" ---------------

if has('autocmd')
  " Turn the relative numbers on and off, based on the COMMAND mode and the
  " focus of the window.
  autocmd FocusLost   * :set number
  autocmd FocusGained * :set relativenumber

  autocmd InsertEnter * :set number
  autocmd InsertLeave * :set relativenumber

  " Have rainbow parantheses everywhere
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces

  " Save the last position in a file.
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd BufReadPost * :DetectIndent

  autocmd FileType python     set expandtab tabstop=4 shiftwidth=4 softtabstop=4 omnifunc=pythoncomplete#Complete
  autocmd FileType c          set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=ccomplete#Complete
  autocmd FileType ruby       set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=rubycomplete#Complete
  autocmd FileType javascript set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=javascriptcomplete#Complete
  autocmd FileType coffee     set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=coffeecomplete#Complete
  autocmd FileType html       set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=htmlcomplete#Complete
  autocmd FileType css        set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=csscomplete#Complete

  highlight                  ExtraWhitespace ctermbg=red guibg=red
  highlight            clear SignColumn
  autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL
endif

" Functions
" ---------

function! ToggleRelativeNumbers()
  if (&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Mappings
" --------

" I have to force myself not to use those anymore.
noremap  <Up> <NOP>
inoremap <Up> <NOP>
vnoremap <Up> <NOP>

noremap  <Down> <NOP>
inoremap <Down> <NOP>
vnoremap <Down> <NOP>

noremap  <Left> <NOP>
inoremap <Left> <NOP>
vnoremap <Left> <NOP>

noremap  <Right> <NOP>
inoremap <Right> <NOP>
vnoremap <Right> <NOP>

nnoremap <F5> :NERDTreeTabsToggle<CR>
inoremap <F5> <ESC>:NERDTreeTabsToggle<CR>

nnoremap <F6> :GundoToggle<CR>
inoremap <F6> <ESC>:GundoToggle<CR>

nnoremap <F7> :TagbarToggle<CR>
inoremap <F7> <ESC>:TagbarToggle<CR>

nnoremap <F8> :call ToggleRelativeNumbers()<CR>
inoremap <F8> <ESC>:call ToggleRelativeNumbers()<CR>

" Navigate through windows with Tab and Shift-Tab.
nnoremap <Tab> <C-w><C-w>
nnoremap <S-Tab> <C-w><C-W>

" Jump to syntastic errors with Up and Down.
map <Up> <ESC>:lprev<CR>
map <Down> <ESC>:lnext<CR>

" Write using `sudo` in COMMAND mode if the file is read-only.
" Ripped off @StanAngeloff.
cnoremap w!! w !sudo tee % >/dev/null

" Format a paragraph to fit in `textwidth`.
nnoremap <leader>f gqip
vnoremap <leader>f gq

" Restore the last selection in VISUAL mode.
nnoremap <leader>v gv

" Edit an inlined chunked of code in it's own buffer.
nnoremap <leader>e :InlineEdit<CR>
vnoremap <leader>e :InlineEdit<CR>

" Align commands. Ripped off @StanAngeloff.
nnoremap <leader>a= :Tabularize /=<CR>
vnoremap <leader>a= m[om]:Tabularize /=<CR>`]V`[

nnoremap <leader>a> :Tabularize /=><CR>
vnoremap <leader>a> m[om]:Tabularize /=><CR>`]V`[

nnoremap <leader>a: :Tabularize /:\zs/l0l1<CR>
vnoremap <leader>a: m[om]:Tabularize /:\zs/l0l1<CR>`]V`[

" I always mess these up on my Das Keyboard. Trying to work around them at
" least in VISUAL mode.
vnoremap u y
vnoremap U Y

" Custom commands
" ---------------

command Light execute "set background=light"
command Dark execute "set background=dark"

" Local settings
" --------------

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" vim: set et ts=2 sts=2:
