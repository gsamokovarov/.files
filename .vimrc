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
Bundle 'pangloss/vim-javascript'
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

let g:detectindent_preferred_expandtab=1

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

" Custom
" ------

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

" vim: set et ts=2 sts=2:
