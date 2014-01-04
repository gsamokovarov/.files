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

# Use the custom solarized LS colors.
if which dircolors > /dev/null ^&1
  [ -f ~/.dir_colors ] and . (dircolors ~/.dir_colors | psub)
end
