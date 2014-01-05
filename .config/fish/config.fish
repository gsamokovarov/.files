# Make sure that ~/.rbenv/bin and ~/bin are prepended to the PATH, so we can
# override system utils, if needed. The path for the custom coreutils and
# /usr/loca/bin are my preferences on OSX.
set PATH $PATH ~/.rbenv/bin ~/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/bin

# Don't show the greeting message on fish boot.
set -x fish_greeting ''

# Initialize rbenv.
status --is-interactive; and . (rbenv init -|psub)

# Add color support for terminals pretending to be xterm.
if [ $TERM = xterm ]
  set -x TERM xterm-256color
end

# Make sure we have a unicode capable LANG and LC_CTYPE so the unicode
# characters does not look like crap on OSX and other environments.
set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# Help out programs spawning editors based on $EDITOR. The same for pagers,
# just use less for them.
set -x EDITOR vim
set -x PAGER less
set -x BROWSER open

# Create completion for an alias.
function make_completion --argument alias command
  complete -c $alias -a "(
    set -l cmd (commandline -op);
    set -e cmd[1];
    complete -C\"$command \$cmd\";
  )"
end

# Rage quit everywhere.
alias Q exit

# Force the regular Vim to open multiple files in tabs.
alias vim 'vim -p'

# Some systems may not be happy with the $TERM of screen-256colors, so be sane.
alias ssh "env TERM=xterm ssh"

# I use vim a lot, so shortcut it to just v.
alias v vim

# Don't even bother with old vi.
alias vi vim

# Same goes for rake, grunt, make and git.
alias r rake
alias u grunt
alias m make
alias d docker
alias g git

# Make completions for the most commonly used aliases.
make_completion g 'git'
make_completion ssh 'ssh'
make_completion v 'vim -p'
make_completion vi 'vim -p'
make_completion vim 'vim -p'

function j
  cd (autojump $argv)
end

# Sudo apt-get as it is always what you want.
alias apt-get "sudo apt-get"

# I never learned how to type freakin' killall.
alias kilalll killall
alias kilall killall

# Use the custom solarized LS colors.
if which dircolors > /dev/null ^&1
  [ -f ~/.dir_colors ] and . (dircolors ~/.dir_colors | psub)
end
