function dark
  if test (cat ~/.colorscheme) = "light"
    echo -e "\033]50;SetProfile=Dark\a"
    set -x BACKGROUND dark

    echo "dark" > ~/.colorscheme
  else
    echo -e "\033]50;SetProfile=Light\a"
    set -x BACKGROUND light

    echo "light" > ~/.colorscheme
  end
end
