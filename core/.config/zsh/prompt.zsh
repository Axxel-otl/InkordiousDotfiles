autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git

shorten_path() {
  local dir="$PWD"

  [[ "$dir" == "$HOME" ]] && echo "~" && return

  case "$dir" in
    "$HOME/Escritorio"*) dir="🖥️${dir#$HOME/Escritorio}" ;;
    "$HOME/Descargas"*)  dir="⬇️${dir#$HOME/Descargas}" ;;
    "$HOME/Documentos"*) dir="📚${dir#$HOME/Documentos}" ;;
    "$HOME/Imágenes"*)   dir="🖼️${dir#$HOME/Imágenes}" ;;
    "$HOME/Música"*)     dir="🎵${dir#$HOME/Música}" ;;
    "$HOME/Vídeos"*)     dir="🎬${dir#$HOME/Vídeos}" ;;
    *) dir="${dir/#$HOME/~}" ;;
  esac

  echo "$dir"
}

error_info() {
  (( LAST_EXIT )) && echo "!${LAST_EXIT}:"
}

git_info() {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  local branch
  branch=$(git branch --show-current 2>/dev/null)

  local ahead behind added modified untracked

  ahead=$(git rev-list --count @{upstream}..HEAD 2>/dev/null)
  behind=$(git rev-list --count HEAD..@{upstream} 2>/dev/null)

  added=$(git diff --cached --name-only 2>/dev/null | wc -l)
  modified=$(git diff --name-only 2>/dev/null | wc -l)
  untracked=$(git ls-files --others --exclude-standard 2>/dev/null | wc -l)

  local out="$branch"

  (( ahead > 0 )) && out+="↑${ahead}"
  (( behind > 0 )) && out+="↓${behind}"
  (( added > 0 )) && out+="+${added}"
  (( modified > 0 )) && out+="~${modified}"
  (( untracked > 0 )) && out+="?${untracked}"

  echo "$out"
}

lang_info() {
  local langs=""

  [[ -f Cargo.toml ]] && langs+="🦀"
  [[ -f package.json ]] && langs+="⬢"
  [[ -f pyproject.toml || -f requirements.txt || -f setup.py ]] && langs+="🐍"
  [[ -f go.mod ]] && langs+="🐹"
  [[ -f pom.xml || -f build.gradle || -f build.gradle.kts ]] && langs+="☕"
  [[ -f CMakeLists.txt || -f Makefile ]] && langs+="⚙️"

  echo "$langs"
}

build_prompt() {
  local git_branch="$(git_info)"
  local langs="$(lang_info)"

  local prompt="%F{red}%m%f"
  prompt+=":%F{green}%f"
  prompt+=":%F{blue}%n%f"
  prompt+=":%F{yellow}$(shorten_path)%f"

  [[ -n "$git_branch" ]] && prompt+=":%F{magenta}${git_branch}%f"
  [[ -n "$langs" ]] && prompt+=":%F{cyan}${langs}%f"

  echo "$(error_info)$prompt"
}

PROMPT='$(build_prompt)$ '
