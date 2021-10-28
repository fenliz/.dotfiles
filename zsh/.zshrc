# Enable Powerlevel10k instant prompt. 
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Local configuration file
if [ -f $HOME/.zshrc.local ]; then
	source $HOME/.zshrc.local
fi

# - Environment Variables 
export DEVELOPMENT="$HOME/development"
export THIRD_PARTY="$HOME/third_party"
export DOTFILES="$HOME/.dotfiles"

export PATH="$PATH:$HOME/.local/bin"

export DEFAULT_USER="$(whoami)"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  z
  zsh-autosuggestions
  git
  ssh-agent
  sudo
  npm
  jsontools
)

zstyle :omz:plugins:ssh-agent identities id_rsa id_ed25519

source $ZSH/oh-my-zsh.sh
# source $THIRD_PARTY/fzf-docker/docker-fzf

# - Aliases 
alias vim='nvim'
alias dev='cd $DEVELOPMENT'
alias development='cd $DEVELOPMENT'
alias dotfiles='cd $DOTFILES'
# alias python='python3'

alias dotfiles-commit='git -C $DOTFILES add --all && git -C $DOTFILES commit -m "Update" && git -C $DOTFILES push'
alias dotfiles-status='git -C $DOTFILES status'
alias dotfiles-update='git -C $DOTFILES pull && bash $DOTFILES/install.sh'

# - Settings 
bindkey '^ ' autosuggest-accept

# Disable ALT+{0-9} (readline arguments)
for i in - {0..9} ; do
	bindkey -r '\e'$i
done

# - Functions

# CTRL-Z out of vim and this makes CTRL-Z go back to vim again
function resume_foreground {
    fg
    zle push-input
    BUFFER=""
    zle accept-line
}
zle -N resume_foreground
bindkey "^Z" resume_foreground

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

if [ -f $HOME/.zshrc.local ]; then
	source $HOME/.zshrc.local
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
