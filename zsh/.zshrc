# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"


plugins=(git rust)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/.local/bin:$PATH
export PATH=/mnt/d/workspace/SDK/platform-tools:$PATH


alias vim="nvim"
alias ls="eza --icons"
alias tree="eza -a --icons -TL=3"
alias man="tldr"
alias adb="adb.exe"

# starship
eval "$(starship init zsh)"

# show pokemon
pokemon-colorscripts --no-title -r 1,3,6

export HAS_BIG_BANG="yes"

# 使用caelestia的配色文件修改终端配色
cat ~/.local/state/caelestia/sequences.txt 2> /dev/null


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
