function light
  echo -e "\033]50;SetProfile=Light\a"
  set -x BACKGROUND light

  echo "light" > ~/.colorscheme
end
