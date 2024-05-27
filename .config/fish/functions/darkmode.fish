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

  if [ "$background" = "dark" ]
    sed -i '' -e 's/Gruvbox (Gogh)/Gruvbox Dark (Gogh)/' ~/.wezterm.lua
  else
    sed -i '' -e 's/Gruvbox Dark (Gogh)/Gruvbox (Gogh)/' ~/.wezterm.lua
  end

  # Notify NeoVim for the color change.
  for pid in (pgrep nvim)
    kill -SIGUSR1 $pid
  end
end
