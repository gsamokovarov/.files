# Setup the oh-my-zsh home directory and theme.
export ZSH=~/.oh-my-zsh
export ZSH_CUSTOM=~
export ZSH_THEME=".smiley"

export SMILEY_HAPPY_FACE="❯"
export SMILEY_SAD_FACE="❯"

# Make sure that ~/.rbenv/bin and ~/bin are prepended to the PATH, so we can
# override system utils, if needed. The path for the custom coreutils and
# /usr/loca/bin are my preferences on OSX.
export PATH=~/.rbenv/bin:~/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH

# Add Ubuntu's command-not-found ZSH alternative and use ssh-agent on the first
# terminal run. The other ones are just candies.
plugins=(git ruby bundler autojump ssh-agent command-not-found)
source $ZSH/oh-my-zsh.sh

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
if [ -f ~/.aliases ] ; then source ~/.aliases ; fi

# Source all of the custom functions living in ~/.functions.
if [ -f ~/.functions ] ; then source ~/.functions ; fi

if `which dircolors &> /dev/null` ; then
  if [ -f ~/.dir_colors ] ; then eval `dircolors ~/.dir_colors` ; fi
fi
# Use the custom solarized LS colors.

# Initialize rbenv.
eval "$(rbenv init -)"

# Include local machine custom settings.
if [ -f ~/.zshrc.local ] ; then source ~/.zshrc.local ; fi
