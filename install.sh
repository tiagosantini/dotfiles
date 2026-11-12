#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
EXPECTED_DIR="$HOME/dotfiles"

if [[ "$DOTFILES_DIR" != "$EXPECTED_DIR" ]]; then
  printf 'This Zsh configuration expects the repository at %s.\n' "$EXPECTED_DIR" >&2
  printf 'Current location: %s\n' "$DOTFILES_DIR" >&2
  printf 'Clone or move the repository to %s, then run this script again.\n' "$EXPECTED_DIR" >&2
  exit 1
fi

link_config() {
  local source="$1"
  local target="$2"
  local backup

  if [[ -L "$target" && "$(readlink -- "$target")" == "$source" ]]; then
    printf 'Already linked: %s\n' "$target"
    return
  fi

  if [[ -e "$target" || -L "$target" ]]; then
    backup="${target}.backup-$(date +%Y%m%d-%H%M%S)"
    while [[ -e "$backup" || -L "$backup" ]]; do
      backup="${target}.backup-$(date +%Y%m%d-%H%M%S)-$RANDOM"
    done
    mv -- "$target" "$backup"
    printf 'Moved existing %s to %s\n' "$target" "$backup"
  fi

  ln -s -- "$source" "$target"
  printf 'Linked: %s -> %s\n' "$target" "$source"
}

mkdir -p "$HOME/.config/nvim" "$HOME/.config/kitty"

link_config "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
link_config "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
link_config "$DOTFILES_DIR/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
link_config "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

printf '\nDotfiles installed. Open a new shell and start Neovim to finish setup.\n'
