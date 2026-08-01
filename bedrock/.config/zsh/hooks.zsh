skip_timer=0
cmd_start=0
LAST_EXIT=0

preexec() {
  cmd_start=$SECONDS
}

notify_long_command() {
  local duration=$((SECONDS - cmd_start))
  (( duration > 10 )) && notify-send "Comando terminado" "Duró ${duration}s"
}

save_last_exit() {
  LAST_EXIT=$?
}

precmd_functions+=(notify_long_command)
precmd_functions+=(save_last_exit)
