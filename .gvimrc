" Use light solarized theme on a transparent terminal.
colorscheme solarized
set background=light

" Set-up a powerline capable font.
set guifont=Ubuntu\ Mono\ 13

" Style powerline for fancy symbols and the solarized theme.
let g:Powerline_symbols='fancy'
let g:Powerline_colorscheme='solarized256'

" If we are running in a gui like GVim, make sure to hide every annoying UI
" piece, like GTK tabs, scrollbars, toolbars, etc.
set guioptions=
