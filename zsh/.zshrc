[[ ! -f $HOME/.zshrc.local ]] || source $HOME/.zshrc.local

eval "$(starship init zsh)" 

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt ignoreeof

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/zshrc/alias.zsh
source ~/zshrc/env.zsh
source ~/zshrc/nvm.zsh
source ~/zshrc/zellij.zsh
source ~/zshrc/bun.zsh

# Auto-complete
source $THIRD_PARTY/zsh-autosuggestions/zsh-autosuggestions.zsh
