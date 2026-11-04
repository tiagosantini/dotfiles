export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/dotfiles/zsh/custom"
# Go uses ~/go as its default GOPATH; avoid spawning `go env` on every shell startup.
export PATH="$PATH:$HOME/go/bin:$HOME/.dotnet/tools"
export SSL_CERT_DIR="$HOME/.aspnet/dev-certs/trust:/etc/ssl/certs"

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
