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

# Aliases
# -------

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
alias v vim;        complete_like v 'vim -p'
alias vi vim;       complete_like vi 'vim -p'
alias vim 'vim -p'; complete_like vim 'vim -p'

# Shortcuts for rake, grunt, make, docker and git.
alias r rake;   complete_like r 'rake'
alias u grunt;  complete_like u 'grunt'
alias m make;   complete_like m 'make'
alias d docker; complete_like d 'docker'
alias g git;    complete_like g 'git'

# Git subcommands shortcuts.
alias gc 'git commit';         complete_like gc 'git commit'
alias gd 'git diff';           complete_like gd 'git diff'
alias gl 'git log';            complete_like gl 'git log'
alias ga 'git commit --amend'; complete_like ga 'git commit';

# Just don't, OK?
alias vag vagrant; complete_like vag 'vagrant'
