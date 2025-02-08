# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git rust zsh-autosuggestions zsh-syntax-highlighting zsh-z)

source $ZSH/oh-my-zsh.sh

export PATH=/home/fergus/.local/bin:$PATH


alias vim="nvim"
alias ls="eza --icons"
alias tree="eza -a --icons -TL=3"
alias man="tldr"

# show pokemon
pokemon-colorscripts --no-title -r 1,3,6

export HAS_BIG_BANG="yes"
