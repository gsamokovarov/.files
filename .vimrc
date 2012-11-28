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

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'godlygeek/tabular'
Bundle 'vim-ruby/vim-ruby'
Bundle 'ervandew/supertab'
Bundle 'bbommarito/vim-slim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kchmck/vim-coffee-script'
Bundle 'Lokaltog/vim-powerline'
Bundle 'thinca/vim-prettyprint'

" Settings
" --------

filetype plugin indent on

set ruler
set wildmenu
set number
set nowrap
set showcmd

set incsearch
set hlsearch

set autoindent
set autoread
set ignorecase
set smartcase
set scrolloff=5

set modeline

set backspace=indent,eol,start
set listchars=eol:¬,tab:→\

set laststatus=2

if has('mouse')
  set mouse=a
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_disabled_filetypes=['c', 'cc', 'cpp', 'h', 'hh', 'hpp']

if !has('gui_running')
  colorscheme solarized
  let g:solarized_termtrans=1
  set background=light
endif

set langmap+=чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю\|,

" vim: set et ts=2 sts=2:
