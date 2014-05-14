" Define my common used thematic themes.
let g:thematic#themes={
    \ 'solarized_light': {
    \   'colorscheme': 'solarized',
    \   'background': 'light',
    \   'airline-theme': 'solarized',
    \  },
    \ 'solarized_dark': {
    \   'colorscheme': 'solarized',
    \   'background': 'dark',
    \   'airline-theme': 'solarized',
    \  },
    \ 'pencil_dark': {
    \   'colorscheme': 'pencil',
    \   'background': 'dark',
    \   'airline-theme': 'badwolf',
    \ },
    \ 'pencil_light': {
    \   'colorscheme': 'pencil',
    \   'background': 'light',
    \   'airline-theme': 'badwolf',
    \ },
    \ 'gruvbox': {
    \   'colorscheme': 'gruvbox',
    \   'background': 'dark',
    \   'airline-theme': 'tomorrow',
    \ }
    \ }

let g:thematic#defaults={
    \ 'typeface': 'Ubuntu Mono derivative Powerline',
    \ 'font-size': 15,
    \ 'laststatus': 2,
    \ 'sign-column-color-fix': 1,
    \ 'fullscreen-background-color-fix': 1,
    \ 'columns': 120,
    \ }

" Blend the sign column background.
let g:gruvbox_sign_column='dark0'

" Use 256 colors everywhere.
set t_Co=256

" The terminal Vim on OSX is slow as f*ck. I don't believe its iTerm that
" is bringing the slownes, either. Someone... HALP!
if has('gui_running')
  " If we are running in a gui like GVim, make sure to hide every annoying UI
  " piece, by default. In MacVim I like the graphical tabs, but those actually
  " look good, so enable it only for the MacVim.
  set guioptions=

  " Set-up a powerline capable font.
  if has('gui_macvim')
    " Better fonts in the UI.
    set antialias

    " Try to fit the maximum characters on the screen and feel the rest of it
    " with the background color in MacVim.
    set fuoptions=maxvert,maxhorz

    " Enable the graphical tabs on Macvim, as those look awesome.
    set guioptions=e

    " Enable a bit of transperancy for the MacVim window. Looks pretty cool.
    set transparency=4

    " The focus follows the mouse. No need to click on a window for that.
    set mousefocus

    " Don't let thematic spawn the window to its fullest. Use 120 columns, which
    " are enough for NERDTree, Gundo, etc. and text around 80 chars. On the
    " other hand, if I don't follow the 79 char rule for that piece of code,
    " 120 chars are a good measurement for a long line.
    set columns=120
  endif

  " Gruvbox for the UI. Looks really cool on it.
  let g:thematic#theme_name='gruvbox'
else
  " Use fancy airline tabs in the terminal.
  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#tabline#show_buffers=0
  let g:airline#extensions#tabline#tab_nr_type=1

  " Solarized for the terminal.
  let g:thematic#theme_name='solarized_light'
endif
