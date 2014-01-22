# Create completion for an alias.
function complete_like --argument alias command
  complete -c $alias -a "(
    set -l cmd (commandline -op);
    set -e cmd[1];
    complete -C\"$command \$cmd\";
  )"
end
