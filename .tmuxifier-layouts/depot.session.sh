session_root "~/Documents/code/research/depot"

if initialize_session "Depot Rails"; then

  new_window "rails-server"
  run_cmd "./bin/rails s"

  new_window "commands"
  run_cmd "git status"

  new_window "commands"
  run_cmd "vim"

  select_window 1
fi
finalize_and_go_to_session
