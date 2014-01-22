# General
# -------

# Make sure that ~/.rbenv/bin and ~/bin are prepended to the PATH, so we can
# override system utils, if needed. The path for the custom coreutils and
# /usr/loca/bin are my preferences on OSX.
set PATH ~/.rbenv/bin ~/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/bin $PATH

# Don't show the greeting message on fish boot.
set -x fish_greeting ''

# Add color support for terminals pretending to be xterm.
if test $TERM = xterm
  set -x TERM xterm-256color
end

# Make sure we have a unicode capable LANG and LC_CTYPE so the unicode
# characters does not look like crap on OSX and other environments.
set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# Don't let fish masquerade itself as other shells.
set -x SHELL (which fish)

# Help out programs spawning editors based on $EDITOR. The same for pagers,
# just use less for them.
set -x EDITOR vim
set -x PAGER less
set -x BROWSER open

# Tell Vagrant to use VMware Fusion as it's default provider.
set -x VAGRANT_DEFAULT_PROVIDER vmware_fusion

# Initialize rbenv for the fish shell.
status --is-interactive; and . (rbenv init - | psub)

# Initialize direnv for the fish shell.
eval (direnv hook fish)

# Use the custom solarized LS colors. Its quite hacky, because they expect bash
# or zsh and exporting environment variables looks differently in fish.
if which dircolors > /dev/null ^&1
  test -f ~/.dir_colors; and . (echo 'set -x '(dircolors ~/.dir_colors | head -1) | psub)
end

# Prompt
# ------

function fish_prompt
  if test $status -eq 0
    echo -n (set_color -o cyan)"☺  "
  else
    echo -n (set_color red)"☹  "
  end
  set_color normal
end

function fish_right_prompt
  echo -n (set_color -o)(test $PWD = $HOME; and echo '~'; or basename $PWD)
  if eval (command git rev-parse --is-inside-work-tree ^/dev/null; or echo false)
    echo -n (set_color -o red)"  "(set_color -o cyan)(__fish_git_prompt "%s")
  end
  set_color normal
end

# Aliases
# -------

# Create completion for an alias.
function make_completion --argument alias command
  complete -c $alias -a "(
    set -l cmd (commandline -op);
    set -e cmd[1];
    complete -C\"$command \$cmd\";
  )"
end

# Alias for autojump. Note that the aliases in fish shell are just functions,
# anyway. alias is just a helper defining functions.
function j; cd (command autojump $argv); end

# Let autojump learn on every directory change.
function __j_learn --on-variable PWD
  status --is-command-substitution; and return
  autojump -a (pwd) ^/dev/null &
end

complete -x -c j -a '(command autojump --complete (commandline -t))'

# Use hub for git with a twist -- if the first argument is an existing branch
# then switch to it.
function git
  switch (count $argv)
    case 1
      set -l target_branch $argv[1]

      # For some reason, the __fish_git_branches and __fish_git_tags functions
      # are not defined during the first run of the git function. Just inline
      # them for now.
      set -l available_branches (command git branch --no-color -a ^/dev/null | sgrep -v ' -> ' | sed -e 's/^..//' -e 's/^remotes\///')
      set -l available_tags (command git tag ^/dev/null)

      if contains $target_branch $available_branches $available_tags
        command git checkout $target_branch
        return 0
      end
  end
  hub $argv
end

# Autocompleate the tags and branches as commands. The git function lets you do
# that and having completion for it is pretty cool.
complete -f -c git -a '(__fish_git_branches)' --description 'Branch'
complete -f -c git -a '(__fish_git_tags)' --description 'Tag'

# Dot aliases.
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias ...... "cd ../../../../.."

# Rage quit everywhere.
alias Q exit

# Sudo apt-get as it is always what you want.
alias apt-get "sudo apt-get"

# I never learned how to type freakin' killall.
alias kilalll killall
alias kilall killall

# Some systems may not be happy with the $TERM of screen-256colors, so be sane.
alias ssh "env TERM=xterm command ssh"

# I use vim a lot, so shortcut it to just v. On top of that, don't bother with
# vi if I mistype it and open multiple files in tabs.
alias v vim;        make_completion v 'vim -p'
alias vi vim;       make_completion vi 'vim -p'
alias vim 'vim -p'; make_completion vim 'vim -p'

# Shortcuts for rake, grunt, make, docker and git.
alias r rake;   make_completion r 'rake'
alias u grunt;  make_completion u 'grunt'
alias m make;   make_completion m 'make'
alias d docker; make_completion d 'docker'
alias g git;    make_completion g 'git'

# Git subcommands shortcuts.
alias gc 'git commit';         make_completion gc 'git commit'
alias gd 'git diff';           make_completion gd 'git diff'
alias gl 'git log';            make_completion gl 'git log'
alias ga 'git commit --amend'; make_completion ga 'git commit';

# Just don't, OK?
alias vag vagrant; make_completion vag 'vagrant'
