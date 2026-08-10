#!/usr/bin/env bash

export PATH="$HOME/.local/bin:$PATH"

nudge() {
	local _result _pane
	trap 'printf "\nnudge: stopped.\n"; return 0' INT TERM

	printf "nudge: watching for agents waiting for input (Ctrl+C to stop)...\n"

	while true; do
		_result=$(herdr agent list 2>/dev/null) || {
			sleep 2
			continue
		}

		while IFS= read -r _pane; do
			herdr pane send-keys "$_pane" Enter 2>/dev/null
		done < <(printf '%s' "$_result" | jq -r '.result.agents[] | select(.agent_status | IN("idle", "running", "working") | not) | .pane_id')

		sleep 1
	done
}

_shell=$(ps -p $$ -ocomm= | tr -d '-')
eval "$(starship init "$_shell")"
eval "$(direnv hook "$_shell")"
unset _shell
