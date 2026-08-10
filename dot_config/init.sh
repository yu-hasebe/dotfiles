#!/usr/bin/env bash

export PATH="$HOME/.local/bin:$PATH"

persona() {
	local _dir="${XDG_CONFIG_HOME:-$HOME/.config}/starship"

	case "${1:-}" in
	list | "")
		local _current="${STARSHIP_CONFIG%.toml}"
		_current="${_current##*/}"
		find "$_dir" -maxdepth 1 -name '*.toml' -exec basename {} .toml \; 2>/dev/null | sort |
			while IFS= read -r t; do
				[ "$t" = "$_current" ] && printf "* %s\n" "$t" || printf "  %s\n" "$t"
			done
		;;
	current)
		local _current="${STARSHIP_CONFIG%.toml}"
		printf "%s\n" "${_current##*/}"
		;;
	help | --help | -h)
		printf "Usage: persona <theme|list|current|help>\n\n"
		printf "  <theme>   switch to theme\n"
		printf "  list      list available themes (default)\n"
		printf "  current   show current theme name\n"
		printf "  help      show this help\n"
		;;
	*)
		local _toml="${_dir}/${1}.toml"
		if [ ! -f "$_toml" ]; then
			printf "Unknown theme: %s\n" "$1" >&2
			return 1
		fi
		export STARSHIP_CONFIG="$_toml"
		printf "Switched to: %s\n" "$1"
		;;
	esac
}

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

_init_theme() {
	local _dir="${XDG_CONFIG_HOME:-$HOME/.config}/starship"
	local -a _themes=("$_dir"/*.toml)
	export STARSHIP_CONFIG="${_themes[$((RANDOM % ${#_themes[@]} + 1))]}"
}
_init_theme
unset -f _init_theme

_shell=$(ps -p $$ -ocomm= | tr -d '-')
eval "$(starship init "$_shell")"
eval "$(direnv hook "$_shell")"
unset _shell
