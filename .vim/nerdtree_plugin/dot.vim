call NERDTreeAddKeyMap({
      \ 'key': '.',
      \ 'callback': 'NERDToggleHiddenFiles',
      \ 'quickhelpText': 'show or hide hidden files'
      \ })

function! NERDToggleHiddenFiles()
  if g:NERDTreeShowHidden == 0
    let g:NERDTreeShowHidden = 1
  else
    let g:NERDTreeShowHidden = 0
  endif

  NERDTreeToggle
  NERDTreeToggle
endfunction
