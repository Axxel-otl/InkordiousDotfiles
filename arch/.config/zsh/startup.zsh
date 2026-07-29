# Mostrar fastfetch una sola vez por sesión gráfica

if [[ -z "$FASTFETCH_SHOWN" ]]; then
  export FASTFETCH_SHOWN=1

  logos=(${XDG_CONFIG_HOME:-$HOME/.config}/fastfetch/pngs/*.(png|jpg|jpeg)(.N))

  if (( ${#logos[@]} )); then
    fastfetch --logo "${logos[$((RANDOM % ${#logos[@]} + 1))]}"
  else
    fastfetch
  fi
fi
