call NERDTreeAddKeyMap({
      \ 'key': '<C-m>',
      \ 'callback': 'NERDTreeClosePane',
      \ 'quickhelpText': 'closes the NERDTree pane'
      \ })


function! NERDTreeClosePane()
  NERDTreeClose
endfunction
