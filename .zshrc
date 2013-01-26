# Setup the oh-my-zsh home directory and theme. I like the jnrowe one. Its
# minimalistic and suites me well.
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="jnrowe"

# One of my setups is actually quite unhappy about this...
export PATH=~/bin:$PATH

# Add Ubuntu's command-not-found ZSH alternative and use ssh-agent on the first
# terminal run. The other ones are just candies.
plugins=(git ruby bundler ssh-agent command-not-found)
source $ZSH/oh-my-zsh.sh

# oh-my-zsh alias sl to ls by default. I really like the lokomotive, though.
unalias sl

# Add color support for terminals pretending to be xterm.
[ $TERM = xterm ] && export TERM=xterm-256color

# Help out programs spawning editors based on $EDITOR. The same for pagers,
# just use less for them.
export EDITOR=vim
export PAGER=less

# Use the custom solarized LS colors.
if [ -f ~/.dir_colors ] ; then eval `dircolors ~/.dir_colors` ; fi

if [ -f /etc/profile.d/rvm.sh ] ; then source /etc/profile.d/rvm.sh ; fi
if [ -f ~/.aliases ] ; then source ~/.aliases ; fi
if [ -f ~/.zshrc.local ] ; then source ~/.zshrc.local ; fi
