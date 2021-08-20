function light
  set -x BACKGROUND light

  echo "light" > ~/.colorscheme

  kitty @ set-colors ~/.config/kitty/gruvbox_light.conf
end
