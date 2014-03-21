call NERDTreeAddKeyMap({
      \ 'key': 'Q',
      \ 'callback': 'NERDTreeCloseTab',
      \ 'quickhelpText': 'closes the whole tab, not just the NERDTree'
      \ })

function! NERDTreeCloseTab()
  wincmd p
  try
    execute "ZZ"
  catch
    execute "q!"
  endtry
endfunction
