# ----------------------------------
# History file and limits
# ----------------------------------

HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

# Share history between open terminals
setopt SHARE_HISTORY

# Append instead of replacing history
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# Remove unnecessary duplicates
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

# Ignore commands beginning with a space
setopt HIST_IGNORE_SPACE

# Remove unnecessary whitespace
setopt HIST_REDUCE_BLANKS

# Show the command before executing history expansion
setopt HIST_VERIFY
