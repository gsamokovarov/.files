# Include local machine custom settings.
[ -f ~/.zshrc.before ] && source ~/.zshrc.before

# Make sure that ~/.rbenv/bin and ~/bin are prepended to the PATH, so we can
# override system utils, if needed. The path for the custom coreutils and
# /usr/loca/bin are my preferences on OSX.
export PATH=~/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH

# Initialize rbenv before initializing the plugins. The bundler plugin needs
# the bundle executable available, so...
[ -z $SKIP_RBENV ] && $(which rbenv &> /dev/null) && {
  export PATH=~/.rbenv/bin:/~/.rbenv/shims:$PATH
  eval "$(rbenv init -)"
}

# Initialize direnv for the ZSH.
[ -z $SKIP_DIRENV ] && $(which direnv &> /dev/null) && eval "$(direnv hook zsh)"

# Initialize jump for the ZSH.
[ -z $SKIP_JUMP ] && $(which jump &> /dev/null) && eval "$(jump shell zsh)"

# Add color support for terminals pretending to be xterm.
[ $TERM = xterm ] && export TERM=xterm-256color

# Make sure we have a unicode capable LANG and LC_CTYPE so the unicode
# characters does not look like crap on OSX and other environments.
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Help out programs spawning editors based on $EDITOR. The same for pagers,
# just use less for them.
export EDITOR=vim
export PAGER=less

# Source all of the aliases living in ~/.aliases.
[ -f ~/.aliases ] && source ~/.aliases

# Source all of the custom functions living in ~/.functions.
[ -f ~/.functions ] && source ~/.functions

# Use the custom solarized LS colors.
$(which dircolors &> /dev/null) && {
  [ -z $SKIP_DIRCOLORS ] && [ -f ~/.dir_colors ] && eval "$(dircolors ~/.dir_colors)"
}

# Be happy. (The above line is an expression, If I don't have a ~/.zshrc.local file
# I'll start with a sad face. I like happy faces.)
true
