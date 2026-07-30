# ---------------------------
# Navigation
# ---------------------------

# Enter a directory by typing its name
setopt AUTO_CD

# Automatically push visited directories onto the directory stack
setopt AUTO_PUSHD

# Do not add the same directory repeatedly
setopt PUSHD_IGNORE_DUPS

# Make pushd with no arguments go to $HOME
setopt PUSHD_TO_HOME

# Exchange the meanings of cd +1 and cd -1
setopt PUSHD_MINUS

# Resolve symbolic links to their actual path when changing directories
# Enable only if you prefer physical paths.
# setopt CHASE_LINKS
