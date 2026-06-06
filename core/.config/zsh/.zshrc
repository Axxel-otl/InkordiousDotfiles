export ZSH="$HOME/.oh-my-zsh"
export ZDOTDIR="$HOME/.config/zsh"
export ZSH_COMPDUMP="$ZDOTDIR/.zcompdump"
export SUDO_ASKPASS=/usr/bin/ksshaskpass

ZSH_THEME="agnoster"

plugins=(git sudo zsh-autosuggestions)

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt append_history share_history hist_ignore_dups hist_reduce_blanks PROMPT_SUBST

autoload -Uz compinit
compinit -d "$ZSH_COMPDUMP" -C

source "$ZSH/oh-my-zsh.sh"

[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source "$ZDOTDIR/exports.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/functions.zsh"
source "$ZDOTDIR/heavy-functions.zsh"
source "$ZDOTDIR/hooks.zsh"
source "$ZDOTDIR/prompt.zsh"
source "$ZDOTDIR/startup.zsh"
