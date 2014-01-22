# Alias for autojump. Note that the aliases in fish shell are just functions,
# anyway. alias is just a helper defining functions.
function j; cd (command autojump $argv); end

# Let autojump learn on every directory change.
function __j_learn --on-variable PWD
  status --is-command-substitution; and return
  autojump -a (pwd) ^/dev/null &
end

complete -x -c j -a '(command autojump --complete (commandline -t))'
