skip_timer=0
cmd_start=0
cmd_running=0
LAST_EXIT=0

preexec() {
  cmd_start=$EPOCHREALTIME
  cmd_running=1
}

notify_long_command() {
  if (( cmd_running )); then
    local duration=$((EPOCHREALTIME - cmd_start))

    if (( duration > 10 )); then
      printf -v duration "%.2f" "$duration"
      notify-send "Comando terminado" "Duró ${duration}s"
    fi

    cmd_running=0
  fi
}

save_last_exit() {
  LAST_EXIT=$?
}

(( ${precmd_functions[(I)notify_long_command]} )) ||
  precmd_functions+=(notify_long_command)

(( ${precmd_functions[(I)save_last_exit]} )) ||
  precmd_functions+=(save_last_exit)
