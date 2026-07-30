export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/dotfiles/zsh/custom"

ZSH_THEME="kphoen"

HIST_STAMPS="%d/%m/%Y %H:%M:%S"

plugins=(
  git
  ssh
  colored-man-pages
  dotenv
  dotnet
  npm

  history-substring-search
  extract
  docker
  command-not-found
  sudo

  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

