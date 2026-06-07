export ZSH="$HOME/.oh-my-zsh"
export SUDO_ASKPASS=/usr/bin/ksshaskpass

ZSH_THEME="agnoster"

plugins=(git sudo zsh-autosuggestions)

HISTSIZE=10000
SAVEHIST=10000

setopt append_history share_history hist_ignore_dups hist_reduce_blanks PROMPT_SUBST

mkdir -p "$ZSHLOCAL"

autoload -Uz compinit
compinit -d "$ZCOMPDUMP" -C

source "$ZSH/oh-my-zsh.sh"

[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source "$ZDOTDIR/exports.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/functions.zsh"
source "$ZDOTDIR/heavy-functions.zsh"
source "$ZDOTDIR/hooks.zsh"
source "$ZDOTDIR/prompt.zsh"
source "$ZDOTDIR/startup.zsh"
