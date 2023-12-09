# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "jeffreytse/zsh-vi-mode"
	
# Load and initialise completion system
autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit
# autoload -Uz compinit
compinit

#zoxide
eval "$(zoxide init zsh)"

#aliases
alias ls="exa -a"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

export PATH="${PATH}:${HOME}/.local/bin/"

#for pywal
(cat ~/.cache/wal/sequences &)

# starship
eval "$(starship init zsh)"

