function dark
  set -x BACKGROUND dark

  echo "dark" > ~/.colorscheme

  kitty @ set-colors ~/.config/kitty/gruvbox_dark.conf
  for pid in (pgrep nvim)
    kill -SIGUSR1 $pid
  end
end
