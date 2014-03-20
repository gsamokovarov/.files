call NERDTreeAddKeyMap({
      \ 'key': 'Q',
      \ 'callback': 'NERDTreeCloseTab',
      \ 'quickhelpText': 'closes the whole tab, not just the NERDTree'
      \ })

function! NERDTreeCloseTab()
  try
    tabclose
  catch
    " If we end up here, its probably because we're trying to close the last
    " tab.
    qa!
  endtry
endfunction
