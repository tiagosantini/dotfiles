#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
EXPECTED_DIR="$HOME/Projects/dotfiles"

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

mkdir -p "$HOME/.config/nvim" "$HOME/.config/kitty" "$HOME/.local/share/konsole"

link_config "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
link_config "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
link_config "$DOTFILES_DIR/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
link_config "$DOTFILES_DIR/konsole/Dotfiles.profile" "$HOME/.local/share/konsole/Dotfiles.profile"
link_config "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

if command -v kwriteconfig6 >/dev/null 2>&1; then
  kwriteconfig_cmd=kwriteconfig6
elif command -v kwriteconfig5 >/dev/null 2>&1; then
  kwriteconfig_cmd=kwriteconfig5
else
  printf 'Warning: kwriteconfig6/5 not found; Konsole shortcuts were not configured.\n' >&2
  kwriteconfig_cmd=
fi

if [[ -n "$kwriteconfig_cmd" ]]; then
  "$kwriteconfig_cmd" --file "$HOME/.config/konsolerc" --group Shortcuts --key Copy 'Ctrl+C' --notify
  "$kwriteconfig_cmd" --file "$HOME/.config/konsolerc" --group Shortcuts --key Paste 'Ctrl+V' --notify
fi

# Remove the old custom color scheme only when it is still our managed symlink.
konsole_colorscheme="$HOME/.local/share/konsole/Dotfiles.colorscheme"
if [[ -L "$konsole_colorscheme" && "$(readlink -- "$konsole_colorscheme")" == "$DOTFILES_DIR/konsole/Dotfiles.colorscheme" ]]; then
  rm -- "$konsole_colorscheme"
  printf 'Removed old managed color scheme link: %s\n' "$konsole_colorscheme"
fi

printf '\nDotfiles installed. Open a new shell and start Neovim to finish setup.\n'
