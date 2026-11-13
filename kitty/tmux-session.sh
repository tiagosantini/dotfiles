#!/usr/bin/env bash

# Start every Kitty window in its own tmux session named kitty-N, using the
# lowest free number. Existing sessions are left untouched; reattach to one
# manually with: tmux attach -t =kitty-N

set -euo pipefail

if ! command -v tmux >/dev/null 2>&1; then
  exec "${SHELL:-/bin/sh}"
fi

for ((index = 1; index <= 1000; index++)); do
  session="kitty-$index"
  if tmux has-session -t "=$session" 2>/dev/null; then
    continue
  fi
  if tmux new-session -d -s "$session" 2>/dev/null; then
    exec tmux attach-session -t "=$session"
  fi
done

# Fallback for an exhausted or unhealthy tmux server: fail with a clear error
# instead of looping forever.
exec tmux new-session -s "kitty-$(date +%s)-$$"
