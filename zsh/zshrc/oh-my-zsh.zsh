# oh-my-zsh
[[ -x $HOME/.oh-my-zsh ]] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh-autosuggestions
ZSH_AUTO_SUGGESTIONS_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
[[ -x $ZSH_AUTO_SUGGESTIONS_DIR ]] || git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_AUTO_SUGGESTIONS_DIR}

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  sudo
  web-search
  copypath
  copyfile
  macos
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
