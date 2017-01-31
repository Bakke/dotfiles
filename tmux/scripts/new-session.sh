#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# global variable
SESSION_NAME="$1"

session_exists() {
	tmux has-session -t "${SESSION_NAME}" >/dev/null 2>&1
}

tmux_socket() {
	echo $TMUX | cut -d',' -f1
}

create_new_tmux_session() {
	if session_exists; then
		tmux switch-client -t "${SESSION_NAME}"
	else
		TMUX="" tmux -S "$(tmux_socket)" new-session -d -s "${SESSION_NAME}"
		tmux switch-client -t "${SESSION_NAME}"
	fi
}

main() {
	create_new_tmux_session
}
main
