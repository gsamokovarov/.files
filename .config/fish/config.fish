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

# Source the aliases in ~/.config/fish/aliases.fish.
test -f ~/.config/fish/aliases.fish; and . ~/.config/fish/aliases.fish
