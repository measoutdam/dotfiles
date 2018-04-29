session_root "~"

if initialize_session "vim"; then

  new_window "commands"
  run_cmd "vim"

fi
finalize_and_go_to_session
