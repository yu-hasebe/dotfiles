set -euo pipefail

# Usage: source this file (do not execute directly)
#
# On source:
#   - Defines functions: warrior, mage, rogue, archer
#       Args: none
#       Output: "Switched to: <theme>"
#       Side effects: writes theme name to ~/.config/starship/theme,
#                     exports STARSHIP_CONFIG=~/.config/starship/<theme>.toml
#   - Defines alias: themes
#       Args: [theme]  (no arg = show current theme and available list)
#       Output: same as above, or "Current theme: <theme>\nAvailable themes: ..."
#   - Restores persisted theme from ~/.config/starship/theme (defaults to warrior)
#       Side effects: exports STARSHIP_CONFIG

_STARSHIP_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/starship"
_STARSHIP_THEME_FILE="$_STARSHIP_DIR/theme"
_STARSHIP_THEMES=(warrior mage rogue archer)

_starship_switch() {
  local theme="${1:-}"
  local config_file="$_STARSHIP_DIR/${theme}.toml"

  if [[ -z "$theme" ]]; then
    local current
    current="$(cat "$_STARSHIP_THEME_FILE" 2>/dev/null)"
    current="${current:-default}"
    echo "Current theme: $current"
    echo "Available themes: ${_STARSHIP_THEMES[*]}"
    return 0
  fi

  if [[ ! -f "$config_file" ]]; then
    echo "Theme '$theme' not found. Available: ${_STARSHIP_THEMES[*]}"
    return 1
  fi

  echo "$theme" > "$_STARSHIP_THEME_FILE"
  export STARSHIP_CONFIG="$config_file"
  echo "Switched to: $theme"
}

for _t in "${_STARSHIP_THEMES[@]}"; do
  eval "function $_t() { _starship_switch '$_t'; }"
done
unset _t

alias themes='_starship_switch'

# Restore persisted theme on shell init
if [[ -f "$_STARSHIP_THEME_FILE" ]]; then
  _saved_theme="$(cat "$_STARSHIP_THEME_FILE")"
  _saved_config="$_STARSHIP_DIR/${_saved_theme}.toml"
  if [[ -f "$_saved_config" ]]; then
    export STARSHIP_CONFIG="$_saved_config"
  fi
  unset _saved_theme _saved_config
else
  export STARSHIP_CONFIG="$_STARSHIP_DIR/warrior.toml"
fi
