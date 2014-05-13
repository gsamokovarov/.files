syntax on
set nocompatible

filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle.
NeoBundleFetch 'Shougo/neobundle.vim'

runtime config/functions.vim
runtime config/bundles.vim
runtime config/builtins.vim
runtime config/plugins.vim
runtime config/styles.vim
runtime config/autocmds.vim
runtime config/mappings.vim

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" vim: set et ts=2 sts=2:
