# ---------------------------
# Aliases
# ---------------------------

# Common Binaries
alias vim="nvim"
alias fetch="fastfetch"

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Listings
alias l='ls -lah'
alias ll='ls -alh'
alias lt='ls -lah --sort=time'

# Disk usage
alias df='df -h'
alias du='du -h'
alias dus='du -sh'

# Processes
alias psg='ps aux | grep -v grep | grep'

# Reload configuration
alias reload-zsh='exec zsh'

# Edit configuration
alias zshconfig='${EDITOR:-vim} ~/.zshrc'
alias zshcustom='${EDITOR:-vim} "${ZSH_CUSTOM:-$ZSH/custom}"'
