Copy() {
  if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
    wl-copy
  else
    xclip -selection clipboard
  fi
}

List() {
  (pwd && tree -apugDR) | less
}

Hello() {
  echo "Hello World"
}

Arduino() {
  local file="$1"

  if [[ -z "$file" || "${file##*.}" != "ino" ]]; then
    echo "Uso: Arduino archivo.ino"
    return 1
  fi

  local boards_fqbn=(
    "arduino:avr:uno"
    "arduino:avr:nano"
    "arduino:avr:mega"
    "arduino:avr:leonardo"
    "arduino:avr:micro"
    "arduino:avr:pro"
    "arduino:avr:lilypad"
  )

  local boards_name=(
    "Arduino Uno"
    "Arduino Nano"
    "Arduino Mega"
    "Arduino Leonardo"
    "Arduino Micro"
    "Arduino Pro/Pro Mini"
    "LilyPad Arduino"
  )

  echo ""
  echo "Selecciona la placa:"
  local i=1
  while (( i <= ${#boards_name[@]} )); do
    printf " [%d] %s\n" "$i" "${boards_name[$i]}"
    ((i++))
  done

  echo ""
  read "board_choice?Número de placa: "

  if ! [[ "$board_choice" =~ ^[0-9]+$ ]] || (( board_choice < 1 || board_choice > ${#boards_fqbn[@]} )); then
    echo "Opción inválida."
    return 1
  fi

  local fqbn="${boards_fqbn[$board_choice]}"

  echo ""
  echo "Puertos disponibles:"
  arduino-cli board list

  echo ""
  read "port?Puerto (ej: /dev/ttyUSB0): "

  echo ""
  echo "[1] Compilar y subir"
  echo "[2] Solo compilar"
  echo "[3] Solo subir"
  echo ""
  read "action?Opción: "

  case "$action" in
    1)
      arduino-cli compile --fqbn "$fqbn" "$file" &&
      arduino-cli upload -p "$port" --fqbn "$fqbn" "$file"
      ;;
    2)
      arduino-cli compile --fqbn "$fqbn" "$file"
      ;;
    3)
      arduino-cli upload -p "$port" --fqbn "$fqbn" "$file"
      ;;
    *)
      echo "Opción inválida."
      return 1
      ;;
  esac
}

Execute() {
  local file="$1"
  local ext="${file##*.}"
  local bin="/tmp/_exc_bin_$$"

  case "$ext" in
    cpp|cc|cxx|c++)
      echo "Archivo de: C++"
      g++ "$file" -o "$bin" && "$bin" "${@:2}"
      ;;
    c)
      echo "Archivo de: C"
      gcc "$file" -o "$bin" && "$bin" "${@:2}"
      ;;
    py)
      echo "Archivo de: Python"

      local venv=".venv"

      if [[ ! -d "$venv" ]]; then
        echo "Creando entorno virtual..."
        python -m venv "$venv" || return 1
      fi

      # Instalar herramientas solo si no existen
      if ! "$venv/bin/python" -m pip show pipreqs >/dev/null 2>&1; then
        echo "Instalando herramientas..."
        "$venv/bin/python" -m pip install --upgrade pip
        "$venv/bin/python" -m pip install pipreqs
      fi

      local project_dir
      project_dir="$(dirname "$(realpath "$file")")"

      local tmp_requirements
      tmp_requirements="$(mktemp)"

      echo "Detectando dependencias..."

      if "$venv/bin/pipreqs" \
          "$project_dir" \
          --force \
          --savepath "$tmp_requirements" \
          >/dev/null 2>&1 &&
          [[ -s "$tmp_requirements" ]]; then

        echo "Instalando dependencias..."
        "$venv/bin/python" -m pip install -r "$tmp_requirements"
      fi

      rm -f "$tmp_requirements"

      "$venv/bin/python" "$file" "${@:2}"
    ;;
    js)
      echo "Archivo de: JavaScript"
      node "$file" "${@:2}"
      ;;
    ts)
      echo "Archivo de: TypeScript"
      ts-node "$file" "${@:2}"
      ;;
    sh|bash)
      echo "Archivo de: Shell"
      bash "$file" "${@:2}"
      ;;
    rb)
      echo "Archivo de: Ruby"
      ruby "$file" "${@:2}"
      ;;
    java)
      echo "Archivo de: Java"
      local classname="${file%.java}"
      javac "$file" && java "$classname" "${@:2}"
      rm -f "$classname.class"
      ;;
    ino)
      echo "Archivo de: Arduino Sketch"
      Arduino "$file"
      ;;
    *)
      echo "No se puede ejecutar ese tipo de archivo."
      rm -f "$bin"
      return 1
      ;;
  esac

  local exit_code=$?
  rm -f "$bin"
  return $exit_code
}

Zbackup() {
  local base="$HOME/.config"
  local stamp
  stamp=$(date +%F-%H%M%S)

  cp -r "$HOME/.config/zsh" "$base/zsh.backup-$stamp" || return 1

  local backups
  backups=($(ls -dt "$base"/zsh.backup-* 2>/dev/null))

  if (( ${#backups[@]} > 5 )); then
    local old
    for old in "${backups[@]:5}"; do
      rm -rf "$old"
    done
  fi

  echo "Backup creado: zsh.backup-$stamp"
  echo "Guardados: $(ls -d "$base"/zsh.backup-* 2>/dev/null | wc -l)"
}

cat() {
  if [[ "$1" == "-md" || "$1" == "--markdown" ]]; then
    glow "${@:2}"
  else
    command cat "$@"
  fi
}

Zlist() {
    local f rel skip pattern
    local ignore_file="$ZDOTDIR/.zshignore"
    local patterns=()

    [[ -f "$ignore_file" ]] && patterns=("${(@f)$(<"$ignore_file")}")

    for f in "$ZDOTDIR"/**/*(DN.); do
        rel="${f#$ZDOTDIR/}"
        skip=0

        for pattern in "${patterns[@]}"; do
            [[ -z "$pattern" || "$pattern" == \#* ]] && continue

            [[ "$rel" == ${~pattern} ]] && {
                skip=1
                break
            }
        done

        (( skip )) && continue

        printf '\n=== %s ===\n' "$rel"
        cat "$f"
    done
}
