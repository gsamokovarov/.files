function fish_prompt
  echo
  echo -n (set_color -o black)(test $PWD = $HOME; and echo '~'; or echo $PWD)
  if eval (command git rev-parse --is-inside-work-tree ^/dev/null; or echo false)
    echo (set_color -o red)"  "(set_color -o black)(__fish_git_prompt "%s")
  end
  set_color normal

  if test $status -eq 0
    echo -n (set_color -o black)"› "
  else
    echo -n (set_color -o red)"› "
  end
  set_color normal
end
