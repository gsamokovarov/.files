# Initialize $HOMEBREW_PREFIX and the likes.
/opt/homebrew/bin/brew shellenv | source

# Make sure that ~/bin is prepended to the PATH, so we can override system
# utils, if needed. The path for the custom coreutils and /usr/loca/bin are my
# preferences on OSX.
set PATH ~/bin "$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin" "$HOMEBREW_PREFIX/bin" /usr/local/bin $PATH

# Setup rust toolchain.
set PATH ~/.cargo/bin $PATH

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

# Try-out mise as an all-in-one Ruby/Node.js/Whatever manager.
mise activate fish | source

# Initialize jump for the fish shell.
jump shell fish | source

# Source the aliases in ~/.config/fish/aliases.fish.
test -f ~/.config/fish/aliases.fish; and source ~/.config/fish/aliases.fish

# Setup volta for nodejs and yarn management.
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
