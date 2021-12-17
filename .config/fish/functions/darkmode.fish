function darkmode --argument preference
  set -l background "light"
  if test -z $preference
    defaults read -g AppleInterfaceStyle 2>/dev/null
    if test $status -eq 0
      set background "dark"
    end
  else
    set background $preference
  end

  set -x BACKGROUND $background

  echo $BACKGROUND > ~/.colorscheme

  set -l kitty_socket unix:(echo /tmp/mykitty-*)

  # Change the kitty colorscheme for every window.
  kitty @ --to $kitty_socket set-colors --all --configured ~/.config/kitty/gruvbox_$BACKGROUND.conf

  # Notify NeoVim for the color change.
  for pid in (pgrep nvim)
    kill -SIGUSR1 $pid
  end
end
