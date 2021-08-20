function light
  set -x BACKGROUND light

  echo "light" > ~/.colorscheme

  kitty @ set-colors ~/.config/kitty/gruvbox_light.conf
  for pid in (pgrep nvim)
    kill -SIGUSR1 $pid
  end
end
