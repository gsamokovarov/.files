# Make sure that ~/bin is prepended to the PATH, so we can override system
# utils, if needed. The path for the custom coreutils and /usr/loca/bin are my
# preferences on OSX.
set PATH ~/bin (brew --prefix)"/opt/coreutils/libexec/gnubin" /usr/local/bin /usr/local/sbin $PATH

# Use my own .rbenv, I don't like what Boxen is doing.
set PATH ~/.rbenv/bin $PATH

# Setup GOPATH to .go and pit its bin folder in the regular $PATH.
set -x GOPATH ~/.go
set PATH $GOPATH/bin $PATH

# Include the relative ./bin, so I can get binstubs and the like in the PATH
# automatically. The node modules binaries are also handy to have around. I
# don't like installing global node packages.
set PATH ./node_modules/.bin $PATH

# Append ./bin, so we don't break the shell when binaries like `test` are
# prepended before /usr/bin/test.
set PATH $PATH ./bin ./exe

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
set -x EDITOR nvim
set -x PAGER less
set -x BROWSER open

# Hint about the background color. By default, it's light, buy I can switch it
# from the light and dark functions.
set -x BACKGROUND light

# Initialize rbenv for the fish shell. Now, the `tail -n +2` is a huge hack,
# with which I stop rbenv prepending ~/.rbenv/shims to the $PATH.
status --is-interactive; and source (rbenv init - | psub)

# Try-out asdf as an all-in-one Ruby/Node.js/Whatever manager.
source (brew --prefix asdf)/asdf.fish

# Initialize direnv for the fish shell.
eval (direnv hook fish)

# Initialize jump for the fish shell.
status --is-interactive; and source (jump shell fish | psub)

# Source the aliases in ~/.config/fish/aliases.fish.
test -f ~/.config/fish/aliases.fish; and source ~/.config/fish/aliases.fish

# Append ~/.krew to the PATH if krew (https://krew.sigs.k8s.io) is installed.
test -d $HOME/.krew; and set -gx PATH $PATH $HOME/.krew/bin

# Source iTerm2 integration.
if test -f ~/.config/fish/iterm2.fish
  set -x iterm2_hostname ""
  source ~/.config/fish/iterm2.fish
end

# Preserve dark/light colorscheme settings on new tabs.
if test -f ~/.colorscheme
  set -l color (cat ~/.colorscheme)
  set -x BACKGROUND $color

  test "$color" = "light"; and light
  test "$color" = "dark"; and dark
end
