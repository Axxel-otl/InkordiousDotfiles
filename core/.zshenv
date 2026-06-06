# Zsh usa ~/.config/zsh como directorio principal
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

# Directorio para estado, historial y demás basura generada
export ZSHLOCAL="${XDG_DATA_HOME:-$HOME/.local/share}/zsh"

mkdir -p "$ZSHLOCAL"

# Historial
export HISTFILE="$ZSHLOCAL/history"

# Compdump (autocompletado)
export ZCOMPDUMP="$ZSHLOCAL/.zcompdump"
