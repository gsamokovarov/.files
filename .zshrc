# Setup the oh-my-zsh home directory and theme.
export ZSH=~/.oh-my-zsh
export ZSH_CUSTOM=~
export ZSH_THEME=".smiley"

# One of my setups is actually quite unhappy about this...
export PATH=~/bin:$PATH

# Add Ubuntu's command-not-found ZSH alternative and use ssh-agent on the first
# terminal run. Also, use the vi-mode, just to be awesome! The other stuff ones
# are just candies.
plugins=(git ruby bundler ssh-agent command-not-found vi-mode)
source $ZSH/oh-my-zsh.sh

# Add color support for terminals pretending to be xterm.
[ $TERM = xterm ] && export TERM=xterm-256color

# Help out programs spawning editors based on $EDITOR. The same for pagers,
# just use less for them.
export EDITOR=vim
export PAGER=less

# oh-my-zsh alias sl to ls by default. I really like the locomotive, though.
unalias sl

# Ubuntu's node.js package binary is named nodejs.
alias nodejs=node

# Use hub for git.
alias git=hub

# Some systems may not be happy with the $TERM of screen-256colors, so be sane.
alias ssh="TERM=xterm ssh"

# Use the custom solarized LS colors.
if [ -f ~/.dir_colors ] ; then eval `dircolors ~/.dir_colors` ; fi

# Use rvm if globally defined. If there is no global config, look for a local
# one too.
if [ -f ~/.rvm/scripts/rvm ] ; then
  source ~/.rvm/scripts/rvm
elif [ -f /etc/profile.d/rvm.sh ] ; then
  source /etc/profile.d/rvm.sh
fi

# Include local machine custom settings.
if [ -f ~/.zshrc.local ] ; then source ~/.zshrc.local ; fi
