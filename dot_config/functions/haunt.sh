haunt() {
	local _result _pane
	trap 'printf "\n"; _msg 👻 haunt "stopped. 🌙"; return 0' INT TERM

	_msg 👻 haunt "watching for agents waiting for input (Ctrl+C to stop)..."

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
