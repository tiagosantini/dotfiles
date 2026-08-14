export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/dotfiles/zsh/custom"
export PATH="$PATH:$(go env GOPATH)/bin"
export SSL_CERT_DIR="$HOME/.aspnet/dev-certs/trust:/etc/ssl/certs"
export PATH="$PATH:/home/tiago/.dotnet/tools"

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

