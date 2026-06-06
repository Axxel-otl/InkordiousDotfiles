# =========================
# XDG Base Directories
# =========================

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# =========================
# Zsh config (dotfiles)
# =========================

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# =========================
# Zsh generated data
# =========================

export ZSHLOCAL="$XDG_STATE_HOME/zsh"

# History
export HISTFILE="$ZSHLOCAL/history"

# Completion dump
export ZSH_COMPDUMP="$ZSHLOCAL/.zcompdump"
export ZCOMPDUMP="$ZSH_COMPDUMP"
