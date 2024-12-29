export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="dhzdhd"

plugins=(git)

eval "$(zellij setup --generate-auto-start zsh)"

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"

alias lgit="lazygit"
alias zlj="zellij"
