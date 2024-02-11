# oh-my-zsh
[[ -x $HOME/.oh-my-zsh ]] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ZSH_PLUGINS_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins

# zsh-autosuggestions
ZSH_AUTO_SUGGESTIONS_DIR=$ZSH_PLUGINS_DIR/zsh-autosuggestions
[[ -x $ZSH_AUTO_SUGGESTIONS_DIR ]] || git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTO_SUGGESTIONS_DIR
 
# zsh-syntax-highlighting
ZSH_SYNTAX_HIGHLIGHTING_DIR=$ZSH_PLUGINS_DIR/zsh-syntax-highlighting
[[ -x $ZSH_SYNTAX_HIGHLIGHTING_DIR ]] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_SYNTAX_HIGHLIGHTING_DIR

# you-should-use
YOU_SHOULD_USE_DIR=$ZSH_PLUGINS_DIR/you-should-use
[[ -x $YOU_SHOULD_USE_DIR ]] || git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $YOU_SHOULD_USE_DIR

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  copyfile
  copypath
  git
  macos
  sudo
  web-search
  you-should-use
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
