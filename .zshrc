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
alias ls="eza -a"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias wp="~/.config/scripts/walfuzzy.sh"
alias ct="~/.config/scripts/termnvimcol.sh"

export PATH="${PATH}:${HOME}/.local/bin/"
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/go/bin:$PATH"

#for pywal
# (cat ~/.cache/wal/sequences &)

# starship
eval "$(starship init zsh)"

