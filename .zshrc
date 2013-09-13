# Setup the oh-my-zsh home directory and theme.
export ZSH=~/.oh-my-zsh
export ZSH_CUSTOM=~
export ZSH_THEME=".smiley"

# Make sure that ~/.rbenv/bin and ~/bin are prepended to the PATH.
export PATH=~/.rbenv/bin:~/bin:/usr/local/bin:$PATH

# Add Ubuntu's command-not-found ZSH alternative and use ssh-agent on the first
# terminal run. The other ones are just candies.
plugins=(git ruby bundler autojump ssh-agent command-not-found)
source $ZSH/oh-my-zsh.sh

# Add color support for terminals pretending to be xterm.
[ $TERM = xterm ] && export TERM=xterm-256color

# Make sure we have a unicode LC_CTYPE so the unicode characters does not look
# like crap.
export LC_CTYPE=UTF-8

# Help out programs spawning editors based on $EDITOR. The same for pagers,
# just use less for them.
export EDITOR=vim
export PAGER=less

# Source all of the aliases living in ~/.aliases.
if [ -f ~/.aliases ] ; then source ~/.aliases ; fi

# Source all of the custom functions living in ~/.functions.
if [ -f ~/.functions ] ; then source ~/.functions ; fi

if `which dircolors &> /dev/null` ; then
  if [ -f ~/.dir_colors ] ; then eval `dircolors ~/.dir_colors` ; fi
fi
# Use the custom solarized LS colors.

# Initialize rbenv.
eval "$(rbenv init -)"

# Shortcut resty to `resty http://example.com/api`.
resty() { . ~/bin/resty ; [ -n "$1" ] && resty $1 }

# Include local machine custom settings.
if [ -f ~/.zshrc.local ] ; then source ~/.zshrc.local ; fi
