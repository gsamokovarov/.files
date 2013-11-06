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
Bundle 'AndrewRadev/sideways.vim'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'Lokaltog/powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'SirVer/ultisnips'
Bundle 'airblade/vim-gitgutter'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ciaranm/detectindent'
Bundle 'dbext.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'ervandew/supertab'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'guns/vim-clojure-static'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'jesseschalken/list-text-object'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'koron/nyancat-vim'
Bundle 'majutsushi/tagbar'
Bundle 'marijnh/tern_for_vim'
Bundle 'matchit.zip'
Bundle 'mattn/emmet-vim'
Bundle 'mileszs/ack.vim'
Bundle 'mintplant/vim-literate-coffeescript.git'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'rodjek/vim-puppet'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sickill/vim-monokai'
Bundle 'sickill/vim-pasta'
Bundle 'sjl/gundo.vim'
Bundle 'slim-template/vim-slim'
Bundle 'timcharper/textile.vim'
Bundle 'tomtom/tcomment_vim'
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
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-tbone'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'

if !has('macunix')
  Bundle 'gorodinskiy/vim-coloresque'
endif

if has('lua') && v:version > 703
  Bundle 'Shougo/neocomplete.vim'
else
  Bundle 'Shougo/neocomplcache.vim'
endif

" Builtin Settings
" ----------------

filetype plugin indent on

" Enforce UTF-8 to reduce my WTF's per minute.
set encoding=utf-8

" Keep the backup files in ~/.vim/backup.
set backupdir=$HOME/.vim/backup

" Keep the undp files in ~/.vim/undo.
set undodir=$HOME/.vim/undo
set undofile

" Keep the swap files in ~/.vim/swap.
set directory=$HOME/.vim/swap

" Don't wrap the long lines.
set nowrap

" Don't display the current Vim mode.
set noshowmode

" Display relative to the selected line number.
set nonumber
set relativenumber

" Don't redraw while executing commands from macros and registers.
set lazyredraw
set ttyfast

" Highlight the search term, while still typing it.
set hlsearch
set incsearch

" Ignore the case when searching.
set ignorecase
set smartcase

" Don't quit the buffer, just hide them.
set hidden

" Read Vim file specific options.
set modeline

" Just indent manually with zf.
set foldmethod=manual

" Copy to the X clipboard too, unless we are on OSX and inside a tmux session.
if !(has('macunix') || empty($TMUX))
  set clipboard+=unnamedplus
endif

" Always complete the longest available first.
set completeopt+=longest

" Highlight the 80th column as an unobtrusive reminder.
set colorcolumn=80

" Syntax highlight only the first 512 characters.
set synmaxcol=512

" Enable the next gen powerline.
set runtimepath+=~/.vim/bundle/powerline/powerline/bindings/vim

" Enable the mouse support if Vim supports it.
if has('mouse')
  set mouse=a
endif

" Make you keyboard actually do something while you are switched to Cyrillic
" layout. Ripped off @StanAngeloff
set langmap+=чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю\|,

" Widely ignore vim swapfiles, tilda backups, python bytecode, .git dirs and
" node modules. Some plugins actually respect those.
set wildignore+=*.sw?,*.un,*~,*py?,.git,node_modules

" Syntax highlight shell scripts as per POSIX, not the original Bourne shell
" which very few use.
let g:is_posix=1

" Plugin settings
" ---------------

" Enable neocomplcache at startup.
let g:neocomplcache_enable_at_startup=1

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
" Try to focus on actual file content when jumping to it.
let g:nerdtree_tabs_focus_on_files=1

" Tell syntastic not to jump to errors and skip /c(++)?/ files.
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0

" Add some fancy symbols for the error and warning messages.
let g:syntastic_error_symbol='⇨'
let g:syntastic_warning_symbol='⇨'

" Show gundo on the right side of the screen.
let g:gundo_right=1

" Clear the default splitjoin mappings.
let g:splitjoin_split_mapping=''
let g:splitjoin_join_mapping=''

" Don't install emmet globally.
let g:user_emmet_install_global = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Style settings
" --------------

" Use light background by default.
set background=light

" Use 256 colors everywhere.
set t_Co=256

" The terminal Vim on OSX is slow as f*ck. I don't believe its iTerm that
" that bringing the slownes, either. Someone... HALP!
if has('gui_running')
  " Set the GUI solarized theme.
  colorscheme solarized

  " If we are running in a gui like GVim, make sure to hide every annoying UI
  " piece, by default. In MacVim I like the graphical tabs, but those actually
  " look good, so enable it only for the MacVim.
  set guioptions=

  " Set-up a powerline capable font.
  if has('gui_macvim')
    " I have an Air. The DPS is quite bigger there.
    set guifont=Ubuntu\ Mono\ derivative\ Powerline:h21

    " Try to fit the maximum characters on the screen and feel the rest of it
    " with the background color in MacVim.
    set fuoptions=maxvert,maxhorz,background:#FFFDF6E3

    " Enable the graphical tabs on Macvim, as those look awesome.
    set guioptions=e
  else
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 15
  endif
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
  autocmd FocusLost,InsertEnter   * if !exists("b:NERDTreeType") | :set norelativenumber number | endif
  autocmd FocusGained,InsertLeave * if !exists("b:NERDTreeType") | :set nonumber relativenumber | endif

  " Recalculate the numbers width on each buffer write.
  autocmd BufReadPost,BufWritePre * :let &l:numberwidth=CalculateBestNumberWidth()

  " Have rainbow parantheses everywhere
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax   * RainbowParenthesesLoadRound
  autocmd Syntax   * RainbowParenthesesLoadSquare
  autocmd Syntax   * RainbowParenthesesLoadBraces

  " Save the last position in a file.
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Try to automatically detect the indentation of the current buffer.
  autocmd BufReadPost * :DetectIndent

  autocmd FileType python
        \ set expandtab tabstop=4 shiftwidth=4 softtabstop=4 |
        \ set omnifunc=pythoncomplete#Complete |

  autocmd FileType c
        \ set expandtab tabstop=2 shiftwidth=2 softtabstop=2 |
        \ set omnifunc=ccomplete#Complete

  autocmd FileType ruby
        \ set expandtab tabstop=2 shiftwidth=2 softtabstop=2 |
        \ set omnifunc=rubycomplete#Complete |

  autocmd FileType javascript
        \ set expandtab tabstop=2 shiftwidth=2 softtabstop=2 |
        \ set omnifunc=javascriptcomplete#Complete

  autocmd FileType coffee
        \ set expandtab tabstop=2 shiftwidth=2 softtabstop=2 |
        \ set omnifunc=coffeecomplete#Complete

  autocmd FileType html
        \ set expandtab tabstop=2 shiftwidth=2 softtabstop=2 |
        \ set omnifunc=htmlcomplete#Complete

  autocmd FileType css
        \ set expandtab tabstop=2 shiftwidth=2 softtabstop=2 |
        \ set omnifunc=csscomplete#Complete

  " Install emmet only in HTML and CSS files.
  autocmd FileType *html*,*css* EmmetInstall

  " Automatically rebalance windows on vim resize.
  autocmd VimResized * :wincmd =

  highlight                  ExtraWhitespace ctermbg=red guibg=red
  highlight            clear SignColumn
  autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL
endif

" Functions
" ---------

function! ToggleRelativeNumbers()
  " If neither of the number settings are turned on, do nothing.
  if !(&l:relativenumber || &l:number)
    return
  endif

  if &l:relativenumber
    set norelativenumber number
  else
    set nonumber relativenumber
  endif
endfunction

function! CalculateBestNumberWidth()
  " Only try to calculate the width, if there is a number setting turned on.
  if &l:relativenumber || &l:number
    " A default numberwidth of 4, looks great to me. You will rarely have
    " files that are less than 10 lines of code and having the relative lines
    " centered is great.
    return max([strlen(line('$')), 3]) + 1
  endif
endfunction

" Mappings
" --------

" I have to force myself not to use those anymore.
nnoremap <Up> <NOP>
inoremap <Up> <NOP>
vnoremap <Up> <NOP>

nnoremap <Down> <NOP>
inoremap <Down> <NOP>
vnoremap <Down> <NOP>

nnoremap <Left> <NOP>
inoremap <Left> <NOP>
vnoremap <Left> <NOP>

nnoremap <Right> <NOP>
inoremap <Right> <NOP>
vnoremap <Right> <NOP>

" Jump to syntastic errors with Up and Down. They're still useful.
nnoremap <Up> <ESC>:lprev<CR>
inoremap <Up> <ESC>:lprev<CR>

nnoremap <Down> <ESC>:lnext<CR>
inoremap <Down> <ESC>:lnext<CR>

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

" Easier to type than :. I don't really use the default ; behavior, so I'm
" fine with just getting rid of it.
nnoremap ; :

" Write using `sudo` in COMMAND mode if the file is read-only.
" Ripped off @StanAngeloff.
cnoremap w!! w !sudo tee % >/dev/null

" When I'm in Bulgarian layout, I don't want to switch it, just to save or
" quit.
cnoreabbrev в w
cnoreabbrev В w
cnoreabbrev Q я
cnoreabbrev я q
cnoreabbrev яа qа
cnoreabbrev яал qаl
cnoreabbrev яалл qаll

" Some other times I just write with the Shift key down. Take care of that
" too.
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq

" Format a paragraph to fit in `textwidth`.
nnoremap <Leader>f gqip
vnoremap <Leader>f gq

" Restore the last selection in VISUAL mode.
nnoremap <Leader>v gv

" Edit an inlined chunked of code in it's own buffer.
nnoremap <Leader>e :InlineEdit<CR>
vnoremap <Leader>e :InlineEdit<CR>

" Align commands. Ripped off @StanAngeloff.
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= m[om]:Tabularize /=<CR>`]V`[

nnoremap <Leader>a> :Tabularize /=><CR>
vnoremap <Leader>a> m[om]:Tabularize /=><CR>`]V`[

nnoremap <Leader>a: :Tabularize /:\zs/l0l1<CR>
vnoremap <Leader>a: m[om]:Tabularize /:\zs/l0l1<CR>`]V`[

" I always mess these up on my Das Keyboard. Trying to work around them at
" least in VISUAL mode.
vnoremap u y
vnoremap U Y

" Have a saner ESCAPE in INSERT mode. Don't try to map those in VISUAL mode or
" you'll get a nasty delay if you type {j,k}.
inoremap jk <Esc>
inoremap kj <Esc>

" Those seems friendlier to type than g{t,T}.
nnoremap <C-K> gt
nnoremap <C-J> gT

" Move function arguments left and right.
nnoremap <C-H> :SidewaysLeft<CR>
nnoremap <C-L> :SidewaysRight<CR>

" Hide the current search.
nnoremap <Return> :nohlsearch<CR>

" Toggle the current fold.
nnoremap <silent> <Space> @=(foldlevel('.') ? 'za' : "\<Space>")<CR>
vnoremap <Space> zf

" Use <Leader>{j,s} for the split joins. I refuse to remember the gJ and gS.
nmap <Leader>j :SplitjoinJoin<CR>
nmap <Leader>s :SplitjoinSplit<CR>

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
