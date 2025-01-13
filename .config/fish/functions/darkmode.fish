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
    sed -i '' -e 's/GruvboxLight/GruvboxDark/' ~/.config/ghostty/config
  else
    sed -i '' -e 's/Gruvbox Dark (Gogh)/Gruvbox (Gogh)/' ~/.wezterm.lua
    sed -i '' -e 's/GruvboxDark/GruvboxLight/' ~/.config/ghostty/config
  end

  # Tell Ghostty to reload the configuration.
  osascript -e '
    tell application "System Events"
      tell application "Ghostty" to activate
      delay 0.5
      tell process "Ghostty"
        click menu item "Reload configuration" of menu "Ghostty" of menu bar 1
      end tell
    end tell
  ' >/dev/null

  # Notify NeoVim for the color change.
  for pid in (pgrep nvim)
    kill -SIGUSR1 $pid
  end
end
