# Setup the oh-my-zsh home directory and theme.
export ZSH=~/.oh-my-zsh
export ZSH_CUSTOM=~
export ZSH_THEME=".smiley"

# Make sure that ~/.rbenv/bin and ~/bin are prepended to the PATH.
export PATH=~/.rbenv/bin:~/bin:$PATH

# Add Ubuntu's command-not-found ZSH alternative and use ssh-agent on the first
# terminal run. The other ones are just candies.
plugins=(git ruby bundler ssh-agent command-not-found)
source $ZSH/oh-my-zsh.sh

# Add color support for terminals pretending to be xterm.
[ $TERM = xterm ] && export TERM=xterm-256color

# Help out programs spawning editors based on $EDITOR. The same for pagers,
# just use less for them.
export EDITOR=vim
export PAGER=less

# oh-my-zsh alias sl to ls by default. I really like the locomotive, though.
unalias sl

# Use hub for git.
alias git=hub

# Some systems may not be happy with the $TERM of screen-256colors, so be sane.
alias ssh="TERM=xterm ssh"

# Use the custom solarized LS colors.
if [ -f ~/.dir_colors ] ; then eval `dircolors ~/.dir_colors` ; fi

# Initialize rbenv.
eval "$(rbenv init -)"

# Include local machine custom settings.
if [ -f ~/.zshrc.local ] ; then source ~/.zshrc.local ; fi
