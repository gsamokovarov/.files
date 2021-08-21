function light
  set -x BACKGROUND light

  echo $BACKGROUND > ~/.colorscheme

  # Change the kitty colorscheme for every window.
  kitty @ set-colors --all --configured ~/.config/kitty/gruvbox_$BACKGROUND.conf

  # Notify NeoVim for the color change.
  for pid in (pgrep nvim)
    kill -SIGUSR1 $pid
  end

  # Focus NeoVim so the changes actually take effect. Bring back the focus to
  # the current window $KITTY_WINDOW_ID at the end.
  for id in (kitty @ ls | jq '.[] | .tabs[].windows[].id') $KITTY_WINDOW_ID
    kitty @ focus-window --match id:$id
  end
end
