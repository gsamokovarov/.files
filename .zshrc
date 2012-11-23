export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="agnoster"

plugins=(git ruby ssh-agent command-not-found)
source $ZSH/oh-my-zsh.sh

export EDITOR=vim
export PAGER=less
export PATH=$PATH:~/bin

[ -f /etc/profile.d/rvm.sh ] && source /etc/profile.d/rvm.sh
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.localrc ] && source ~/.localrc
