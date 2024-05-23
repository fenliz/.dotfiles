[[ ! -f $HOME/.zshrc.local ]] || source $HOME/.zshrc.local

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt ignoreeof

source ~/zshrc/oh-my-zsh.zsh
source ~/zshrc/alias.zsh
source ~/zshrc/env.zsh
source ~/zshrc/nvm.zsh
source ~/zshrc/bun.zsh

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
