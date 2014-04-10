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
alias gco 'git commit';        complete_like gco 'git commit'
alias gd 'git diff';           complete_like gd 'git diff'
alias gl 'git log';            complete_like gl 'git log'
alias ga 'git commit --amend'; complete_like ga 'git commit'

# Yes, that happened today. Age, you know...
alias mdkir mkdir

# Bundle shortcuts.
alias be 'bundle exec'; complete_like be 'bundle exec'

# Just don't, OK?
alias vag vagrant; complete_like vag 'vagrant'
