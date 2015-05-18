# Set the homebrew path to the default place where Boxen puts it.
set PATH /usr/local/homebrew/bin $PATH

# Make sure that ~/bin is prepended to the PATH, so we can override system
# utils, if needed. The path for the custom coreutils and /usr/loca/bin are my
# preferences on OSX.
set PATH ~/bin (brew --prefix)"/opt/coreutils/libexec/gnubin" /usr/local/bin /usr/local/sbin $PATH

# Prepend the relative ./bin, so I can get binstubs and the like in the PATH
# automatically. The node modules binaries are also handy to have around. I
# don't like installing global node packages.
set PATH ./bin ./node_modules/.bin $PATH

# Use my own .rbenv, I don't like what Boxen is doing.
set PATH ~/.rbenv/bin ~/.rbenv/shims $PATH

# Don't show the greeting message on fish boot.
set -x fish_greeting ''

# Add color support for terminals pretending to be xterm.
test $TERM = xterm; and set -x TERM xterm-256color

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

# Allow the use of VMware Fusion Technology Preview versions.
set -x VAGRANT_VMWARE_FUSION_EXP 1

# Initialize rbenv for the fish shell. Now, the `tail -n +2` is a huge hack,
# with which I stop rbenv prepending ~/.rbenv/shims to the $PATH.
status --is-interactive; and . (rbenv init - | psub)

# Initialize direnv for the fish shell.
eval (direnv hook fish)

# Use the custom solarized LS colors. Its quite hacky, because they expect bash
# or zsh and exporting environment variables looks differently in fish.
if which dircolors > /dev/null ^&1
  test -f ~/.dir_colors; and . (echo 'set -x '(dircolors ~/.dir_colors | head -1) | psub)
end

if [ -f (brew --prefix)/share/autojump/autojump.fish ]
  . (brew --prefix)/share/autojump/autojump.fish
  complete -x -c j -a '(command autojump --complete (commandline -t))'
end

# Source the aliases in ~/.config/fish/aliases.fish.
test -f ~/.config/fish/aliases.fish; and . ~/.config/fish/aliases.fish
