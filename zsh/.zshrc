[[ ! -f $HOME/.zshrc.local ]] || source $HOME/.zshrc.local
source $HOME/.zsh_profile

# Starship
eval "$(starship init zsh)" 

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Auto-complete
source ~/third_party/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# forgit
[ -f ~/third_party/forgit/forgit.plugin.zsh ] && source ~/third_party/forgit/forgit.plugin.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export FLYCTL_INSTALL="/home/charlie/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
