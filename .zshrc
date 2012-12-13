export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="jnrowe"

plugins=(git ruby bundler ssh-agent command-not-found)
source $ZSH/oh-my-zsh.sh

export EDITOR=vim
export PAGER=less
export PATH=$PATH:~/bin

if [ -f /etc/profile.d/rvm.sh ] ; then source /etc/profile.d/rvm.sh ; fi
if [ -f ~/.aliases ] ; then source ~/.aliases ; fi
if [ -f ~/.localrc ] ; then source ~/.localrc ; fi
