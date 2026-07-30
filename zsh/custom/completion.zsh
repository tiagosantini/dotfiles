# --------------------------------
# Completion
# --------------------------------

# Interactive completion menu
zstyle ':completion:*' menu select

# Group results by category
zstyle ':completion:*' group-name ''

# Add category descriptions
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

# Display useful completion messages
zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'

# Use terminal colors for file completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Complete case-insensitively first
zstyle ':completion:*' matcher-list \
  'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=*' \
  'l:|=* r:|=*'

# Reuse completion for commands following sudo
zstyle ':completion::complete:*' gain-privileges 1

# Cache expensive completion results
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path \
  "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completion"
