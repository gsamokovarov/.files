" Setup
" -----

syntax on
set nocompatible

filetype off

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Bundles
" -------

" Let NeoBundle manage NeoBundle.
NeoBundleFetch 'Shougo/neobundle.vim'

" Install vimproc, so NeoBundle can be async.
NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
        \     'windows' : 'make -f make_mingw32.mak',
        \     'cygwin' : 'make -f make_cygwin.mak',
        \     'mac' : 'make -f make_mac.mak',
        \     'unix' : 'make -f make_unix.mak',
        \    },
        \ }

NeoBundle 'marijnh/tern_for_vim', {
        \ 'build' : {
        \     'windows' : 'npm install .',
        \     'cygwin' : 'npm install .',
        \     'mac' : 'npm install .',
        \     'unix' : 'npm install .',
        \    },
        \ }

NeoBundle 'JazzCore/ctrlp-cmatcher', {
        \ 'build' : {
        \     'windows' : 'install_windows.bat',
        \     'cygwin' : './install_linux.sh',
        \     'mac' : './install_linux.sh',
        \     'unix' : './install_linux.sh',
        \    },
        \ }

NeoBundle 'AndrewRadev/sideways.vim'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'
NeoBundle 'ciaranm/detectindent'
NeoBundle 'dag/vim-fish'
NeoBundle 'ervandew/supertab'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'jesseschalken/list-text-object'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'kana/vim-textobject-user'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'koron/nyancat-vim'
NeoBundle 'matchit.zip'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'reedes/vim-colors-pencil'
NeoBundle 'reedes/vim-litecorrect'
NeoBundle 'reedes/vim-textobj-sentence'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/bundler.vim'
NeoBundle 'tpope/rake.vim'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-tbone'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-scripts/AutoTag'

if has('lua') && v:version > 703
  NeoBundle 'Shougo/neocomplete.vim'
else
  NeoBundle 'Shougo/neocomplcache.vim'
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

" I name my tags file .tags as I don't like them listed by ls and the like.
set tags+=.tags

" Watch for file changes.
set autoread

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

" Highlight the search term while still typing it.
set hlsearch
set incsearch

" Ignore the case when searching.
set ignorecase
set smartcase

" Read Vim file specific options.
set modeline

" Just indent manually with zf.
set foldmethod=manual

" Turn the spell check on by default.
set spell

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

" Enable the mouse support if Vim supports it.
if has('mouse')
  set mouse=a

  " Force dragging support with the mouse.
  set ttymouse=xterm2
endif

" Make you keyboard actually do something while you are switched to Cyrillic
" layout. Ripped off @StanAngeloff.
set langmap+=чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю\|,

" Widely ignore vim swapfiles, tilda backups, python bytecode, .git dirs and
" node modules and vendor directories. Some plugins actually respect those.
set wildignore+=*.sw?,*.un,*~,*py?,.git,node_modules,vendor

" Don't ring any bells.
set visualbell t_vb=

" Some plugins expect bash or zsh as their shells. Fish shell has a different
" stderr redirection syntax and it may break stuff, like Syntastic, for
" example.
set shell=/bin/bash

" Syntax highlight shell scripts as per POSIX, not the original Bourne shell
" which very few use.
let g:is_posix=1

" Plugin settings
" ---------------

" Use powerline patched fonts in airline.
let g:airline_powerline_fonts=1

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

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher for
" grep and Ack.
if executable('ag')
  let g:ackprg='ag --nogroup --column --ignore=vendor --ignore=node_modules --ignore=.bundle'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore=vendor\ --ignore=node_modules\ --ignore=.bundle
endif

" Use speedier git-list-files and mercurial alternatives to listing files in a
" folder when possible and fall back to ag otherwise.
let g:ctrlp_user_command={
    \ 'types': {
    \   1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
    \   2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': 'ag %s -l --nocolor -g --ignore=vendor --ignore=node_modules --ignore=.bundle""'
    \ }

" Use the C matcher function provided by ctrlp-cmatcher.
let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
let g:ctrlp_max_files = 0

" Use caching to speed CtrlP up.
let g:ctrlp_use_caching=1

" Don't use typographic quotes. Dunno how to type them :D
let g:litecorrect#typographic=1

" Configure wildfire to accept caret fences and be more effective in HTML.
let g:wildfire_objects={
    \ "*" : ["i'", 'i"', "i`", "i)", "i]", "i}", "ip"],
    \ "html,xml" : ["i'", 'i"', "i`", "i)", "i]", "i}", "i<", "at"],
    \ }

" Style settings
" --------------

" Assume dark background by default.
set background=dark

" Use 256 colors everywhere.
set t_Co=256

" The terminal Vim on OSX is slow as f*ck. I don't believe its iTerm that
" is bringing the slownes, either. Someone... HALP!
if has('gui_running')
  " Set the GUI pencil theme.
  colorscheme pencil

  " If we are running in a gui like GVim, make sure to hide every annoying UI
  " piece, by default. In MacVim I like the graphical tabs, but those actually
  " look good, so enable it only for the MacVim.
  set guioptions=

  " Set-up a powerline capable font.
  if has('gui_macvim')
    " Fifteen points works well on 1440x900 simulated resolution on a fancy
    " new Retina MacBook Pro.
    set guifont=Ubuntu\ Mono\ derivative\ Powerline:h15

    " Try to fit the maximum characters on the screen and feel the rest of it
    " with the background color in MacVim.
    set fuoptions=maxvert,maxhorz,background:#FFFDF6E3

    " Enable the graphical tabs on Macvim, as those look awesome.
    set guioptions=e

    " Enable a bit of transperancy for the MacVim window. Looks pretty cool.
    set transparency=4

    " The focus follows the mouse. No need to click on a window for that.
    set mousefocus
  else
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 15
  endif
else
  colorscheme pencil

  " Use fancy airline tabs in the terminal.
  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#tabline#show_buffers=0
  let g:airline#extensions#tabline#tab_nr_type=1
endif

" Use the badwolf theme for airline. Fits well with pencil-dark.
let g:airline_theme='badwolf'

" Custom settings
" ---------------

if has('autocmd')
  " Turn the relative numbers on and off, based on the COMMAND mode and the
  " focus of the window.
  autocmd FocusLost,InsertEnter   * if !exists("b:NERDTreeType") | :set norelativenumber number | endif
  autocmd FocusGained,InsertLeave * if !exists("b:NERDTreeType") | :set nonumber relativenumber | endif

  " Recalculate the numbers width on each buffer write.
  autocmd BufWritePre * :let &l:numberwidth=CalculateBestNumberWidth()

  " Save the last position in a file.
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Try to automatically detect the indentation of the current buffer.
  autocmd BufReadPost * :DetectIndent

  autocmd FileType python
        \ set expandtab tabstop=4 shiftwidth=4 softtabstop=4 |
        \ set omnifunc=pythoncomplete#Complete

  autocmd FileType c
        \ set cindent expandtab tabstop=2 shiftwidth=2 softtabstop=2 |
        \ set omnifunc=ccomplete#Complete

  autocmd FileType ruby
        \ set expandtab tabstop=2 shiftwidth=2 softtabstop=2 |
        \ set omnifunc=rubycomplete#Complete

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

  " Automatically rebalance windows on Vim resize.
  autocmd VimResized * :wincmd =

  highlight                  ExtraWhitespace ctermbg=red guibg=red
  highlight            clear SignColumn
  autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

  " Words to avoid in tech writing.
  "
  "   obviously, basically, simply, of course, clearly,
  "   just, everyone knows, However, So, easy
  "
  " See http://css-tricks.com/words-avoid-educational-writing/.

  highlight TechWordsToAvoid ctermbg=red ctermfg=white

  autocmd FileType markdown call MatchTechWordsToAvoid()
  autocmd BufWinEnter *.md call MatchTechWordsToAvoid()
  autocmd InsertEnter *.md call MatchTechWordsToAvoid()
  autocmd InsertLeave *.md call MatchTechWordsToAvoid()
  autocmd BufWinLeave *.md call clearmatches()
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

function WriteAndOrQuit()
  try
    execute "ZZ"
  catch
    execute "q!"
  endtry
endfunction

function! MatchTechWordsToAvoid()
  match TechWordsToAvoid /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/
endfunction

" Choose '^' or '0' depending on the cursor position.
function! CleverJumpFirst()
  let l:before = getline('.')[:col('.') - 1]
  if l:before =~ '^\s\+\S$'
    return '0'
  endif
  return '^'
endfunction

" Mappings
" --------

" Map the <Leader> to the comma.
let mapleader=","

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

" Jump to next * matches.
nnoremap <Up>   N
nnoremap <Left> N

nnoremap <Down>  n
nnoremap <Right> n

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

" Choose '^' or '0' depending on the cursor position.
nnoremap <expr> 0 CleverJumpFirst()
vnoremap <expr> 0 CleverJumpFirst()

" Easier to type than :. I don't really use the default ; behavior, but I'm
" keeping it just in case in the :. Plus, swapping those two will teach me not
" to press the damn Shift anymore.
nnoremap ; :
nnoremap : ;

vnoremap ; :
vnoremap : ;

" I'm thinking of a decent usage for the Q key, so I'm starting with the rage
" quit.
nnoremap Q :call WriteAndOrQuit()<CR>

" Format a paragraph to fit in `textwidth`.
nnoremap <Leader>f gqap
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
inoremap jk <ESC>
inoremap kj <ESC>

" If you're writing in Bulgarian, don't switch to English only to ESCAPE.
inoremap йк <ESC>
inoremap кй <ESC>

" If you double tap {j,k} in INSERT mode it will go into NORMAL and scroll one
" line up or down. The l is there to make up for cursor being displayed one
" character before the point you hit {jj,kk}.
inoremap jj <ESC>lj
inoremap kk <ESC>lk

inoremap йй <ESC>lj
inoremap кк <ESC>lk

" Those seems friendlier to type than g{t,T}.
nnoremap <C-K> gt
nnoremap <C-J> gT

" Move function arguments left and right.
nnoremap <C-H> :SidewaysLeft<CR>
nnoremap <C-L> :SidewaysRight<CR>

" Toggle the current fold.
nnoremap <silent> <Space> @=(foldlevel('.') ? 'za' : "\<Space>")<CR>
vnoremap <Space> zf

" Use <Leader>{j,s} for the split joins. I refuse to remember the gJ and gS.
nnoremap <Leader>j :SplitjoinJoin<CR>
nnoremap <Leader>s :SplitjoinSplit<CR>

" Custom commands
" ---------------

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

" Tabe is typed quite often around here.
cnoreabbrev Tabe tabe

" I type this often and holding Shift each time isn't that nice. Sometimes I
" would also mistake it for ag anyway, so put that one to use too.
cnoreabbrev ack Ack
cnoreabbrev ag Ack

command Light execute "set background=light"
command Dark execute "set background=dark"

" Local settings
" --------------

if filereadable(expand("~/.vimrc.local")) | source ~/.vimrc.local | endif

" vim: set et ts=2 sts=2:
