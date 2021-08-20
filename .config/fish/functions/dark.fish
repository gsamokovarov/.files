function dark
  set -x BACKGROUND dark

  echo "light" > ~/.colorscheme

  kitty @ set-colors ~/.config/kitty/gruvbox_dark.conf
end
