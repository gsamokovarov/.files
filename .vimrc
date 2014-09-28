" {{{ Setup

syntax on

set nocompatible

filetype plugin indent on
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle.
NeoBundleFetch 'Shougo/neobundle.vim'

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" }}}

" {{{ Dependencies

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
        \     'cygwin' : './install.sh',
        \     'mac' : 'bash -c "rm autoload/build -rf; FLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments ./install.sh"',
        \     'unix' : './install.sh',
        \    },
        \ }

NeoBundle 'Valloric/YouCompleteMe', {
        \ 'build' : {
        \     'cygwin' : './install.sh --clang-completer',
        \     'mac' : './install.sh --clang-completer',
        \     'unix' : './install.sh --clang-completer',
        \    },
        \ }

NeoBundle 'AndrewRadev/sideways.vim'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'
NeoBundle 'ciaranm/detectindent'
NeoBundle 'dag/vim-fish'
NeoBundle 'godlygeek/tabular'
NeoBundle 'jesseschalken/list-text-object'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'reedes/vim-colors-pencil'
NeoBundle 'reedes/vim-textobj-sentence'
NeoBundle 'reedes/vim-thematic'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-scripts/AutoTag'

" }}}

" {{{ Functions
function! CalculateBestNumberWidth()
  " Only try to calculate the width, if there is a number setting turned on.
  if &l:relativenumber || &l:number
    " A default numberwidth of 4, looks great to me. You will rarely have
    " files that are less than 10 lines of code and having the relative lines
    " centered is great.
    return max([strlen(line('$')), 3]) + 1
  endif
endfunction

function! WriteAndOrQuit()
  try
    execute "ZZ"
  catch
    execute "q!"
  endtry
endfunction

" Choose '^' or '0' depending on the cursor position.
function! CleverJumpFirst()
  let l:before = getline('.')[:col('.') - 1]
  if l:before =~ '^\s\+\S$'
    return '0'
  endif
  return '^'
endfunction

function! ToggleMouse()
  if !exists("s:old_mouse")
    let s:old_mouse = "a"
  endif

  if &mouse == ""
    let &mouse = s:old_mouse
  else
    let s:old_mouse = &mouse
    let &mouse=""
  endif
endfunction
" }}}

" {{{ Builtin Settings

" Enforce UTF-8 to reduce my WTF's per minute.
set encoding=utf-8

" Keep the backup files in ~/.vim/backup.
set backupdir=$HOME/.vim/backup

" Keep the undo files in ~/.vim/undo.
set undodir=$HOME/.vim/undo
set undofile

" Save the view files in ~/.vim/view. The view files keep the state of manual
" folds and the cursor only.
set viewdir=$HOME/.vim/view
set viewoptions=folds,cursor

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

" Automatically write buffers. Save keystrokes.
set autowrite

" Don't display any numbers, I have the current one in the airline status bar
" anyway. Although the relative numbers are nice, they waste CPU and you can
" really tell that on OSX.
set norelativenumber
set nonumber

" Don't redraw while executing commands from macros and registers.
set lazyredraw
set ttyfast

" Prefer full redraws for smaller scroll regions.
set ttyscroll=10

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

" Make split behave.
set splitbelow

" Get rid of the annoying |,= characters on vertical split bar separator and
" the filling characters of the folded lines.
set fillchars=vert:\ ,fold:\ 

" Show trailing whitespace as ·
set list
set listchars=tab:\ \ ,trail:·

" Copy to the X clipboard too, unless we are on OSX and inside a tmux session.
if !(has('macunix') || empty($TMUX))
  set clipboard+=unnamedplus
endif

" Always complete the longest available first.
set completeopt+=longest

" Don't hilight the 80th (or any) column as an unobtrusive reminder.
set colorcolumn=0

" Syntax highlight only the first 512 characters.
set synmaxcol=512

" Don't match any pair characters. Wastes CPU redrawing the screen.
set matchpairs=

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

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher for
" grep and Ack.
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore=vendor\ --ignore=node_modules\ --ignore=.bundle
endif

" Syntax highlight shell scripts as per POSIX, not the original Bourne shell
" which very few use.
let g:is_posix=1

" Use the system Ruby for the ftplugin shenanigans.
let g:ruby_path="/usr/bin/ruby"

" }}}

" {{{ Plugin Settings

" {{{ Powerline
" Use powerline patched fonts in airline.
let g:airline_powerline_fonts=1
" }}}

" {{{ DetectIndent
" Tell detectindent to use one tab, if it is confused.
let g:detectindent_preferred_expandtab=1
" }}}

" {{{ NERDTree
" Ignore tilda editor leftovers and python junk in the NERDTree. Keep those as
" NERDTree seem not to respect wildignore"{{{
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '^.sass-cache$']"}}}

" Use a minimal UI for the NERDTree. No wasted space on 'Press ? for help'
" headers.
let NERDTreeMinimalUI=1

" Try to fill up most of the screen.
let NERDTreeWinSize=999

" Quit the NERDTree while opening files.
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1

" Hijack Netrw even though I don't use the drawer approach anymore.
let NERDTreeHijackNetrw=1

" Ripping off Stani (@StanAngeloff). Again :D
let g:nerdtree_tabs_open_on_new_tab=0
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_gui_startup=0

function! CloseNERDTreeInTab(i)
  let l:me = tabpagenr()
  let l:previous_ei = &ei
  set ei=all

  exec 'tabnext ' . a:i
  call nerdtree#closeTreeIfOpen()
  exec 'tabnext ' . l:me

  let &ei = l:previous_ei
endfunction

function! ToggleNERDTree()
  let l:me = tabpagenr()
  for i in range(1, tabpagenr('$'))
    if i != l:me
      call CloseNERDTreeInTab(i)
    endif
  endfor

  " If NERDTree is visible and inactive in the current tab, focus.
  if (g:NERDTree.ExistsForTab() && nerdtree#getTreeWinNum() != -1) && ! g:NERDTree.ExistsForBuf()
    execute 'silent! NERDTreeFocus'
  else
    execute 'silent! NERDTreeMirrorToggle'
  endif
endfunction

" Make sure a NERDTree instance is mirrored for all tabs.
" This is needed as if the buffer with the only NERDTree instance is closed,
" the state is reset for the next mirror.
if has('autocmd')
  " Silently open and immediately close a NERDTree.
  autocmd TabEnter * if !exists('t:hasNERDTree')
        \ |   let t:hasNERDTree=1
        \ |   execute 'silent! NERDTreeMirrorOpen'
        \ |   execute 'silent! NERDTreeMirrorToggle'
        \ | endif

endif
" }}}

" {{{ Syntastic
" Tell syntastic not to jump to errors and skip /c(++)?/ files.
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0

" Try to optimize syntastic in terminal Vim as its already 0 on MacVim.
let syntastic_full_redraws=0

" Speed up syntastic a bit.
let g:syntastic_enable_highlighting=0

" Add some fancy symbols for the error and warning messages.
let g:syntastic_error_symbol='✗'
let g:syntastic_style_error_symbol='✠'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_warning_symbol='≈'

" Skip schema.rb, it can destroy the terminal Vim.
let g:syntastic_ignore_files=['\mschema\.rb$']

" Use rubocop as the default ruby linter, but first run it through MRI.
let g:syntastic_ruby_checkers=['mri', 'rubocop']
" }}}

" {{{ Gundo
" Show gundo on the right side of the screen.
let g:gundo_right=1
" }}}

" {{{ SplitJoin
" Clear the default splitjoin mappings.
let g:splitjoin_split_mapping=''
let g:splitjoin_join_mapping=''
" }}}

" {{{ GitGutter
let g:gitgutter_sign_column_always=1
" }}}

" {{{ CtrlP
" Make CtrlPMixed the default command.
let g:ctrlp_cmd="CtrlPMixed"

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
let g:ctrlp_match_func={'match': 'matcher#cmatch'}

" Use caching to speed CtrlP up.
let g:ctrlp_use_caching=1
let g:ctrlp_max_files=10000

" Don't use MRU files. They don't fit my workflow and annoy me. A lot.
let g:ctrlp_mruf_max = 0
" }}}

" {{{ Litecorrect
" Don't use typographic quotes. Dunno how to type them :D
let g:litecorrect#typographic=1
" }}}

" {{{ YouCompleteMe
" Let YouCompleteMe load candidates from the tags file.
let g:ycm_collect_identifiers_from_tags_files=1
" }}}

" {{{ Eclim
let g:EclimCompletionMethod='omnifunc'
" }}}

" {{{ DelimitMate
" Let it work with vim-endwise which also expands on return.
let b:delimitMate_expand_cr=1
" }}}

" {{{ Unite
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--nogroup --nocolor --column'
" }}}

" }}}

" {{{ Style Settings

" Define my common used thematic themes.
let g:thematic#themes={
    \ 'solarized_light': {
    \   'colorscheme': 'solarized',
    \   'background': 'light',
    \   'airline-theme': 'solarized',
    \  },
    \ 'solarized_dark': {
    \   'colorscheme': 'solarized',
    \   'background': 'dark',
    \   'airline-theme': 'solarized',
    \  },
    \ 'gruvbox': {
    \   'colorscheme': 'gruvbox',
    \   'background': 'dark',
    \   'airline-theme': 'tomorrow',
    \ }
    \ }

let g:thematic#defaults={
    \ 'typeface': 'Ubuntu Mono derivative Powerline',
    \ 'font-size': 14,
    \ 'laststatus': 2,
    \ 'sign-column-color-fix': 1,
    \ 'fullscreen-background-color-fix': 1,
    \ 'columns': 120,
    \ }

" Blend the sign column background.
let g:gruvbox_sign_column='dark0'

" Use 256 colors everywhere.
set t_Co=256

" The terminal Vim on OSX is slow as f*ck. I don't believe its iTerm that
" is bringing the slownes, either. Someone... HALP!
if has('gui_running')
  " If we are running in a gui like GVim, make sure to hide every annoying UI
  " piece, by default. In MacVim I like the graphical tabs, but those actually
  " look good, so enable it only for the MacVim.
  set guioptions=

  " Set-up a powerline capable font.
  if has('gui_macvim')
    " Better fonts in the UI.
    set antialias

    " Try to fit the maximum characters on the screen and feel the rest of it
    " with the background color in MacVim.
    set fuoptions=maxvert,maxhorz

    " Enable a bit of transperancy for the MacVim window. Looks pretty cool.
    set transparency=1

    " The focus follows the mouse. No need to click on a window for that.
    set mousefocus

    " Don't let thematic spawn the window to its fullest. Use 120 columns, which
    " are enough for NERDTree, Gundo, etc. and text around 80 chars. On the
    " other hand, if I don't follow the 79 char rule for that piece of code,
    " 120 chars are a good measurement for a long line.
    set columns=120
  endif

  " Gruvbox for the UI. Looks really cool on it.
  let g:thematic#theme_name='gruvbox'
else
  " Solarized for the terminal.
  let g:thematic#theme_name='solarized_light'
endif

" Use fancy airline tabs in the terminal.
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#tabline#tab_nr_type=1

" }}}

" {{{ Auto Commands

if has('autocmd')
  " Save the last position in a file.
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Try to automatically detect the indentation of the current buffer. The
  " BufWritePost is there to detect indentation on new files.
  autocmd BufReadPost,BufWritePost * :DetectIndent

  autocmd FileType python
        \ set expandtab tabstop=4 shiftwidth=4 softtabstop=4 |
        \ set omnifunc=pythoncomplete#Complete

  autocmd FileType c
        \ set smartindent cindent expandtab tabstop=2 shiftwidth=2 softtabstop=2 |
        \ set omnifunc=ccomplete#Complete

  autocmd FileType java
        \ set smartindent cindent expandtab tabstop=4 shiftwidth=4 softtabstop=4

  autocmd Filetype go
        \ set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 |
        \ let b:delimitMate_matchpairs = "(:),[:],{:}"

  autocmd FileType ruby
        \ set expandtab tabstop=2 shiftwidth=2 softtabstop=2 |
        \ set omnifunc=rubycomplete#Complete |
        \ set iskeyword+=?,! |
        " Use the older RegExp engine as Ruby syntax is painfully slow with
        " the current one.
        \ setlocal re=1

  autocmd FileType javascript
        \ set expandtab tabstop=2 shiftwidth=2 softtabstop=2 |
        \ set omnifunc=javascriptcomplete#Complete |
        \ let b:delimitMate_matchpairs = "(:),[:],{:}" |
        \ :DetectIndent

  autocmd FileType coffee
        \ set expandtab tabstop=2 shiftwidth=2 softtabstop=2 |
        \ set omnifunc=coffeecomplete#Complete

  autocmd FileType puppet
        \ let b:delimitMate_matchpairs = "(:),[:],{:}"

  autocmd FileType html
        \ set expandtab tabstop=2 shiftwidth=2 softtabstop=2 |
        \ set omnifunc=htmlcomplete#Complete |
        \ :DetectIndent

  autocmd FileType css
        \ set expandtab tabstop=2 shiftwidth=2 softtabstop=1 |
        \ set omnifunc=csscomplete#Complete |
        \ :DetectIndent

  autocmd FileType markdown
        \ nnoremap <buffer> = yypVr= |
        \ nnoremap <buffer> - yypVr-

  " Automatically rebalance windows on Vim resize.
  autocmd VimResized * :wincmd =

  " See https://github.com/tpope/vim-rails/issues/25.
  autocmd BufReadPre *.rb let b:skip_auto_mkview_magic=1

  " Format Go files on write.
  autocmd BufWritePost *.go silent! Fmt

  " Automatically save and load view state, unless it's Ruby, cause vim-rails
  " gets really confused and the useful A* and R* commands don't work. Need to
  " find a way to disable it only for Rails projects.
  if !exists('b:skip_auto_mkview_magic')
    autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
    autocmd BufRead      * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
  endif

  autocmd FileType markdown silent WeakWordy
  autocmd BufWinEnter *.md  silent WeakWordy
  autocmd InsertEnter *.md  silent WeakWordy
  autocmd InsertLeave *.md  silent WeakWordy
  autocmd BufWinLeave *.md  silent WeakWordy
endif

" }}}

" {{{ Mappings

" Map the <Leader> to the comma.
let mapleader=","

" No random help screens, please.
nnoremap <F1> <NOP>

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

" Filter Ex commands with <C-{P,N}>.
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

if has("gui_macvim") && has("gui_running")
  " Map Command-# to switch tabs in MacVim.
  nnoremap <D-0> 0gt
  inoremap <D-0> <Esc>0gt
  nnoremap <D-1> 1gt
  inoremap <D-1> <Esc>1gt
  nnoremap <D-2> 2gt
  inoremap <D-2> <Esc>2gt
  nnoremap <D-3> 3gt
  inoremap <D-3> <Esc>3gt
  nnoremap <D-4> 4gt
  inoremap <D-4> <Esc>4gt
  nnoremap <D-5> 5gt
  inoremap <D-5> <Esc>5gt
  nnoremap <D-6> 6gt
  inoremap <D-6> <Esc>6gt
  nnoremap <D-7> 7gt
  inoremap <D-7> <Esc>7gt
  nnoremap <D-8> 8gt
  inoremap <D-8> <Esc>8gt
  nnoremap <D-9> :tablast<CR>
  inoremap <D-9> <Esc>:tablast<CR>
endif

" When text is wrapped, move up and down by visual lines.
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk

nnoremap <Up>   N
nnoremap <Left> N

nnoremap <Down>  n
nnoremap <Right> n

nnoremap <silent> <F5> :call ToggleNERDTree()<CR>
inoremap <silent> <F5> <ESC>:call ToggleNERDTree()<CR>
nnoremap <silent> <Leader>5 :call ToggleNERDTree()<CR>

nnoremap <F6> :GundoToggle<CR>
inoremap <F6> <ESC>:GundoToggle<CR>
nnoremap <Leader>6 :GundoToggle<CR>

nnoremap <F7> :call ToggleMouse()<CR>
inoremap <F7> <ESC>:call ToggleMouse()<CR>
nnoremap <Leader>7 :call ToggleMouse()<CR>

nnoremap <F8> :call ToggleRelativeNumbers()<CR>
inoremap <F8> <ESC>:call ToggleRelativeNumbers()<CR>
nnoremap <Leader>8 :call ToggleRelativeNumbers()<CR>

" Navigate through windows with Tab and Shift-Tab.
nnoremap <Tab> <C-w><C-w>
nnoremap <S-Tab> <C-w><C-W>

" I'm used to the fish shell and auto-completing suggestions with Ctrl-e.
" Remapping it to Tab does the job for YouCompleteMe.
imap <C-E> <Tab>

" Go to the m marked spot. Its quite easier to type mm and when needing to go
" back, `` will do the job. The default `` behaviour isn't useful for me.
nnoremap `` `m

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

" Get back the "Undo motion".
nnoremap <Leader><Leader> ,
vnoremap <Leader><Leader> ,

" Format the whole file by default.
nnoremap = mmg=GG`m

" I mistype that a lot.
nmap <C-m> <C-n>

" Grep with unite, its better than ack.vim and the likes.
nnoremap <C-G> :Unite grep:.<CR>

" I'm thinking of a decent usage for the Q key, so I'm starting with the rage
" quit.
nnoremap <silent> Q :call WriteAndOrQuit()<CR>

" Cycle through bad words.
nnoremap <silent> K :NextWordy<CR>

" Cycle through thematic themes.
nnoremap <Leader>t :ThematicNext<CR>

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

" Use {_,+}. I refuse to remember the gJ and gS.
nnoremap _ :SplitjoinJoin<CR>
nnoremap + :SplitjoinSplit<CR>

" Use - to switch stuff around, like old-style to new-style Ruby hashes.
nnoremap - :Switch<CR>

" Write using `sudo` in COMMAND mode if the file is read-only.
" Ripped off @StanAngeloff.
cnoremap w!! w !sudo tee % >/dev/null

" When I'm in Bulgarian layout, I don't want to switch it, just to save or
" quit.
cnoreabbrev в w
cnoreabbrev В w
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

" }}}

" vim: set et ts=2 sts=2 fdm=marker:
