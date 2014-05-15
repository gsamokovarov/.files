if has('autocmd')
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
        \ set omnifunc=rubycomplete#Complete |
        \ set iskeyword+=?,! |
        " Use the older RegExp engine as Ruby syntax is painfully slow with
        " the current one.
        \ setlocal re=1

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
        \ set expandtab tabstop=2 shiftwidth=2 softtabstop=1 |
        \ set omnifunc=csscomplete#Complete

  autocmd FileType markdown 
        \ nnoremap <buffer> = yypVr= |
        \ nnoremap <buffer> - yypVr-

  " Automatically rebalance windows on Vim resize.
  autocmd VimResized * :wincmd =

  " See https://github.com/tpope/vim-rails/issues/25.
  autocmd BufReadPre *.rb let b:skip_auto_mkview_magic=1

  " Automatically save and load view state, unless it's Ruby, cause vim-rails
  " gets really confused and the useful A* and R* commands don't work. Need to
  " find a way to disable it only for Rails projects.
  if !exists('b:skip_auto_mkview_magic')
    autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
    autocmd BufRead      * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
  endif

  highlight                  ExtraWhitespace ctermbg=red guibg=red
  highlight            clear SignColumn
  autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

  autocmd FileType markdown silent WeakWordy
  autocmd BufWinEnter *.md  silent WeakWordy
  autocmd InsertEnter *.md  silent WeakWordy
  autocmd InsertLeave *.md  silent WeakWordy
  autocmd BufWinLeave *.md  silent WeakWordy
endif
