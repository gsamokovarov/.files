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

Bundle 'AndrewRadev/multichange.vim'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bbommarito/vim-slim'
Bundle 'ciaranm/detectindent'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'gregsexton/gitv'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'koron/nyancat-vim'
Bundle 'pangloss/vim-javascript'
Bundle 'rodjek/vim-puppet'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'thinca/vim-prettyprint'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'

" Builtin Settings
" ----------------

filetype plugin indent on

set ruler
set wildmenu
set number
set nowrap
set showcmd
set showmode
set lazyredraw
set ttyfast

set incsearch
set hlsearch

set autoindent
set autoread
set ignorecase
set smartcase
set scrolloff=5

set modeline

set clipboard+=unnamed

set complete-=i
set completeopt-=preview
set completeopt+=longest

set backspace=indent,eol,start
set listchars=eol:¬,tab:→\

set laststatus=2

if has('mouse')
  set mouse=a
endif

set langmap+=чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю\|,

" Plugin settings
" ---------------

" Tell detectindet to use one tab, if it is confused.
let g:detectindent_preferred_expandtab=1

" Ignore tilda editor (and vim) leftovers and python junk in the NERDTree.
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.swp$', '\.swo$']

" Ignore tilda, .sw? and python junk in CtrlP too.
let g:ctrlp_custom_ignore='\v[\/](\~$)|(\.sw[op]$)|(\.py[co]$)'

" Tell syntastic not to jump to errors and skip /c(++)?/ files.
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_disabled_filetypes=['c', 'cc', 'cpp', 'h', 'hh', 'hpp']

" Add some fancy symbols for the error and warning messages.
let g:syntastic_error_symbol='▶'
let g:syntastic_warning_symbol='▶'

" Style settings
" --------------

" Style a bit the syntastic messages.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" I'm using mostly terminal vim, so style for that.
if !has('gui_running')
  " Use light solarized theme on a transparent terminal.
  colorscheme solarized
  let g:solarized_termtrans=1
  set background=light

  " Style powerline for fancy symbols and the solarized theme.
  let g:Powerline_symbols='fancy'
  let g:Powerline_colorscheme='solarized256'
endif

" Have rainbow paratheses everywhere
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Custom settings
" ---------------

if has('autocmd')
  " Save the last position in a file.
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd BufReadPost * :DetectIndent

  autocmd FileType python     set expandtab tabstop=4 shiftwidth=4 softtabstop=4 omnifunc=pythoncomplete#Complete
  autocmd FileType c          set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=ccomplete#Complete
  autocmd FileType ruby       set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=rubycomplete#Complete
  autocmd FileType javascript set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=javascriptcomplete#Complete
  autocmd FileType coffee     set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=coffeecomplete#Complete
  autocmd FileType html       set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=htmlcomplete#Complete
  autocmd FileType css        set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=csscomplete#Complete

  highlight                  ExtraWhitespace ctermbg=red guibg=red
  autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL
endif

" Mappings
" --------

nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :GundoToggle<CR>
nnoremap <F7> :set paste!<CR>

nnoremap <Tab> gt
nnoremap <S-Tab> gT

" vim: set et ts=2 sts=2:
