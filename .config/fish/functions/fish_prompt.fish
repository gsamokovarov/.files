function fish_prompt
  if test $status -eq 0
    echo -n (set_color -o green)"♡  "
  else
    echo -n (set_color red)"♡  "
  end
  set_color normal
end

function fish_right_prompt
  echo -n (set_color -o grey)(test $PWD = $HOME; and echo '~'; or basename $PWD)
  if eval (command git rev-parse --is-inside-work-tree ^/dev/null; or echo false)
    echo -n (set_color -o red)"  "(set_color -o grey)(__fish_git_prompt "%s")
  end
  set_color normal
end
