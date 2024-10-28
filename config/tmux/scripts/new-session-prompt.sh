#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
	tmux command -p "New session name:" "run '${CURRENT_DIR}/new-session.sh \"%1\"'"
}
main
