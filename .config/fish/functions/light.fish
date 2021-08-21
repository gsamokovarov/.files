function light
  set -x BACKGROUND light

  echo $BACKGROUND > ~/.colorscheme

  # Notify NeoVim for the color change.
  for pid in (pgrep nvim)
    kill -SIGUSR1 $pid
  end

  for id in (kitty @ ls | jq '.[] | .tabs[].windows[].id')
    # Change the kitty colorscheme for every window.
    kitty @ set-colors --match id:$id --configured ~/.config/kitty/gruvbox_$BACKGROUND.conf

    # Focus NeoVim so the changes actually take effect.
    kitty @ focus-window --match id:$id
  end

  # Focus back the current kitty window that issued the command.
  kitty @ focus-window --match id:$KITTY_WINDOW_ID
end
