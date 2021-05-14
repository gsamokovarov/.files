" {{{ Setup

syntax on

set nocompatible

filetype plugin indent on
filetype off

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Start installing plugins.
call plug#begin(expand('~/.vim/plugged'))

" }}}

" {{{ Dependencies

Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'ElmCast/elm-vim'
Plug 'Shougo/unite.vim' | Plug 'gsamokovarov/vimfiler.vim'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'bogado/file-line'
Plug 'dense-analysis/ale'
Plug 'dyng/ctrlsf.vim'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'gsamokovarov/vim-ruby-heredoc-syntax'
Plug 'janko-m/vim-test'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', { 'do': {-> coc#util#install()} }
Plug 'rakr/vim-one'
Plug 'rstacruz/vim-closer'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/gitignore'

" Tell vim-plug to not expect any more bundles.
call plug#end()

" }}}

" {{{ Functions

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

" Create new test files in vim-rails powered projects. Ripped of from:
" https://github.com/AndrewRadev/Vimfiles/blob/master/personal/plugin/rnew.vim
command! -nargs=0 Rnew call s:Rnew(@%)
function! s:Rnew(name)
  let parts     = split(a:name, '/')
  let base_name = parts[-1]
  let dir_parts = parts[0:-2]

  let underscored_name = base_name
  if underscored_name =~ '\.rb$'
    let underscored_name = fnamemodify(underscored_name, ':r')
  endif

  call s:CreateRubyTest(underscored_name, dir_parts)

  redraw!
endfunction

function! s:CreateRubyTest(name, dir_parts)
  let test_name = join(a:dir_parts + [a:name . '_spec.rb'], '/')

  if test_name =~ '\<app/'
    let test_name = s:SubstitutePathSegment(test_name, 'app', 'spec')
  else
    let test_name = s:SubstitutePathSegment(test_name, 'lib', 'spec/lib')
  endif

  call s:EnsureDirectoryExists(test_name)

  exe 'split '.test_name
  call append(0, [
        \ 'require ''rails_helper''',
        \ '',
        \ ])
  $delete _
  normal! G
  write
endfunction

function! s:SubstitutePathSegment(expr, segment, replacement)
  return substitute(a:expr, '\(^\|/\)'.a:segment.'\(/\|$\)', '\1'.a:replacement.'\2', '')
endfunction

function! s:EnsureDirectoryExists(file)
  let dir = fnamemodify(a:file, ':p:h')

  if !isdirectory(dir)
    call mkdir(dir, 'p')
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
set tags+=.tags,.git/tags

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

" Show the current line and character position in the command bar.
set ruler

" Don't show the status bar. Strive for minimalism!
set laststatus=0
set noshowmode

" Don't show a tab bar. It is wasting real estate.
set showtabline=0

" Don't redraw while executing commands from macros and registers.
set lazyredraw
set ttyfast

" This is the time in milliseconds that is waited for a key code or mapped key
" sequence to complete. By default its a 1000, lower it a bunch. This speeds
" up the exit of insert mode.
"
" Note that this is also the timeout between multi stroke commands. yo or
" <leader>5 will appear not working if I can't type them in the timeout.
" Setting notimeout fixes the timeout for mappings.
set notimeout
set ttimeout
set ttimeoutlen=10

" Highlight the search term while still typing it.
set hlsearch
set incsearch

" Ignore the case when searching.
set ignorecase
set smartcase

" Read Vim file specific options.
set modeline

" Start scrolling when you reach three lines before the end of the screen.
" Helps with the neck pain.
set scrolloff=3

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

" Set backspace explicitly and include start and eol for delimitMate
" compatibility. Removing indentation with backspace is pretty handy as well.
set backspace=indent,start,eol

" Don't hilight the 80th (or any) column as an unobtrusive reminder.
set colorcolumn=0

" Syntax highlight only the first 512 characters.
set synmaxcol=512

" Don't match any pair characters. Wastes CPU redrawing the screen.
set matchpairs=

" Enable the mouse support if Vim supports it.
if has('mouse')
  set mouse=a

  " Neovim, for example, doesn't have it
  if has('ttymouse')
    " Force dragging support with the mouse.
    set ttymouse=xterm2
  endif
endif

" Make you keyboard actually do something while you are switched to Cyrillic
" layout. Ripped off @StanAngeloff.
set langmap+=чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю\|,

" Widely ignore vim swapfiles, tilda backups, python bytecode, .git dirs and
" node modules and vendor directories. Some plugins actually respect those.
set wildignore+=*.sw?,*.un,*~,*py?,.git,node_modules

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

" {{{ CoC
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gf <Plug>(coc-fix-current)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <C-]> gd

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" }}}

" {{{ VimTest
let test#strategy='neovim'
" }}}

" {{{ Sleuth
let g:sleuth_automatic=1
" }}}

" {{{ DemoteFromLet

" Turn rspec let{,!} calls into local variable declarations. This helps with
" the converting specs from the bad style to the explicit one. It also helps
" for the good minitest conversions.
function! DemoteFromLet()
  try
    :.s/let!\?(:\(\w\+\)) { \(.*\) }$/\1 = \2/
  catch
  endtry

  try
    :.s/subject { \(.*\) }$/\1/
  catch
  endtry

  try
    :.s/before { \(.*\) }$/\1/
  catch
  endtry

  :normal ==
endfunction

command! DemoteFromLet :call DemoteFromLet()

nnoremap dl <ESC>:DemoteFromLet<CR>
vnoremap dl <ESC>:DemoteFromLet<CR>
" }}}

" {{{ VimFiler
" Disable netrw.
let g:loaded_netrwPlugin=1

" Replace netrw with vimfiler.
let g:vimfiler_as_default_explorer=1

" Enable file operation commands.
" Edit file by tabedit.
call vimfiler#custom#profile('default', 'context', {
     \ 'safe': 0,
     \ 'edit_action': 'tabopen',
     \ })

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon=' '
let g:vimfiler_tree_opened_icon='▾'
let g:vimfiler_tree_closed_icon='▸'
let g:vimfiler_file_icon='-'
let g:vimfiler_marked_file_icon='*'
" }}}

" {{{ SplitJoin
" Clear the default splitjoin mappings.
let g:splitjoin_split_mapping=''
let g:splitjoin_join_mapping=''
" }}}

" {{{ GitGutter
" Trade speed for accuracy.
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_override_sign_column_highlight = 0
" }}}

" {{{ FZF
set rtp+=/usr/local/opt/fzf

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob \!.git'
" }}}

" {{{ Litecorrect
" Don't use typographic quotes. Dunno how to type them :D
let g:litecorrect#typographic=1
" }}}

" {{{ CtrlSF
" Show results as a split to the bottom, not to the left.
let g:ctrlsf_position='bottom'
let g:ctrlsf_ackprg='/usr/local/bin/rg'
" }}}

" {{{ Markdown
" Highlight code fences in markdown.
let g:markdown_fenced_languages=['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'html']
" }}}

" {{{ Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
" }}}

" {{{ Ruby
let ruby_minlines = 100
let ruby_spellcheck_strings = 0

let g:ruby_indent_end_alignment = "variable"
let g:ruby_indent_block_style = 'do'
" }}}

" {{{ Closetag
let g:closetag_filenames='*.html,*.html.erb,*.xhtml,*.phtml'
" }}}

" {{{ Elm
let g:elm_detailed_complete=1
let g:elm_format_autosave=1
let g:elm_format_fail_silently=0
" }}}

" {{{ ALE
let g:ale_fixers = {
\   'json': ['prettier'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\   'scss': ['stylelint'],
\   'css': ['stylelint'],
\   'ruby': ['rubocop'],
\}

" Run the project specific rubocop/standardrb version.
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_standardrb_executable = 'bundle'

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

let g:ale_fix_on_save = 1
" }}}

" }}}

" {{{ Style Settings

" Set a colorscheme here, so we avoid the initial unstyled flash.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if (has("termguicolors"))
	set termguicolors
endif

if $BACKGROUND ==# "dark"
  set background=dark
else
  set background=light
endif

colorscheme gruvbox

highlight SignColumn ctermbg=NONE guibg=NONE

" The terminal Vim on OSX is slow as f*ck. I don't believe its iTerm that
" is bringing the slowness, either. Someone... HALP!
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

    " Enable a bit of transparency for the MacVim window. Looks pretty cool.
    set transparency=1

    " The focus follows the mouse. No need to click on a window for that.
    set mousefocus
  endif
endif
" }}}

" {{{ Auto Commands

if has('autocmd')
  " Save the last position in a file.
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  autocmd FileType ruby,eruby
        \ set omnifunc=rubycomplete#Complete |
        \ set iskeyword+=?,! |
        " Use the older RegExp engine as Ruby syntax is painfully slow with
        " the current one.
        \ setlocal re=1 |

  autocmd FileType puppet
        \ set iskeyword+=:

  autocmd Filetype go
        \ set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2

  autocmd FileType javascript,typescript,typescriptreact,typescript.tsx,jsx,tsx
        \ let b:closer = 1 |
        \ let b:closer_flags = '([{' |
        \ set expandtab tabstop=2 shiftwidth=2 softtabstop=2 |
        \ set re=0

  autocmd FileType coffee
        \ set omnifunc=coffeecomplete#Complete

  au BufRead,BufNewFile *.ego setfiletype html
  autocmd FileType html
        \ set omnifunc=htmlcomplete#Complete |
        \ set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2

  autocmd FileType css
        \ set omnifunc=csscomplete#Complete

  autocmd FileType markdown
        \ nnoremap <buffer> = yypVr= |
        \ nnoremap <buffer> - yypVr-

  " Automatically rebalance windows on Vim resize.
  autocmd VimResized * :wincmd =
endif

" }}}

" {{{ Mappings

" Map the <Leader> to the comma.
let mapleader=","

" No random help screens, please.
nnoremap <F1> <NOP>

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

" Center the screen when going back. I use it quite often to jump to the
" previous location.
nnoremap <C-O> <C-O>zz

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Map to C-m, which is triggered by Enter/Return as well.
nnoremap <silent> <C-m> :VimFiler -explorer -find -toggle -force-hide<CR>

" Keep the old CtrlP shortcut.
nnoremap <silent> <C-P> :call fzf#vim#files('.', {'options': '--prompt ">> " --inline-info'})<CR>

" Navigate through windows with Tab and Shift-Tab.
nnoremap <Tab> <C-w><C-w>
nnoremap <S-Tab> <C-w><C-W>

" I'm used to the fish shell and auto-completing suggestions with Ctrl-e.
" Make Tab/Ctrl-E do a C-n for completions.
inoremap <expr><C-e> pumvisible() ? "\<C-n>" : "\<Tab>"

" Go to the m marked spot. Its quite easier to type mm and when needing to go
" back, `` will do the job. The default `` behaviour isn't useful for me.
nnoremap `` `mzz

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

" Format the current paragraph.
nnoremap = mmVap=`m

" Grep with CtrlSF, its better than ack.vim and the likes.
nmap     <C-S> <Plug>CtrlSFPrompt
vmap     <C-S> <Plug>CtrlSFVwordPath
vmap     <C-S>s <Plug>CtrlSFVwordExec
nmap     <C-S>n <Plug>CtrlSFCwordPath
nmap     <C-S>p <Plug>CtrlSFPwordPath
nnoremap <C-S>o :CtrlSFOpen<CR>

" I'm thinking of a decent usage for the Q key, so I'm starting with the rage
" quit.
nnoremap <silent> Q :call WriteAndOrQuit()<CR>
nnoremap <silent> Я :call WriteAndOrQuit()<CR>

" Format a paragraph to fit in `textwidth`.
nnoremap <Leader>f gqap
vnoremap <Leader>f gq

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Run the current test file.
nnoremap <Leader>t :TestFile<CR>
nnoremap <Leader>T<CR> :TestNearest<CR>

" Show more details about a Language Server message.
nnoremap <Leader>d :ALEDetail<CR>

" I'm used to the :Gco and :Gst commands but they are deprecated by fugitive.
cnoremap Gco Git commit
cnoremap Gst Git

" Those seems friendlier to type than g{t,T}.
nnoremap <C-K> gt
nnoremap <C-J> gT

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

" Its impressive how often I mistype this.
inoreabbrev inititalize initialize

" }}}

" vim: set et ts=2 sts=2 fdm=marker:
