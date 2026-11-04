# ---------------------------
# Optional developer tools
# ---------------------------

# fzf provides Ctrl-R history search, Ctrl-T file search, and Alt-C directory search.
# Keep startup working even when these tools have not been installed yet.
if (( $+commands[fzf] )); then
  eval "$(fzf --zsh)"
fi

# Replace `cd` with zoxide's frecency-based directory jumper (`z` / `zi`).
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
fi

# Small interactive conveniences for optional CLI tools.
if (( $+commands[bat] )); then
  alias catp='bat --paging=never'
fi

if (( $+commands[delta] )); then
  alias gdiff='git -c core.pager=delta diff'
fi

if (( $+commands[tmux] )); then
  # Attach to a named session, creating it if it does not exist.
  tn() { tmux new-session -A -s "${1:-main}" }
fi
