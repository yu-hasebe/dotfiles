#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
	rm -rf "$2"
	ln -s "$1" "$2"
}

main() {
	link "$DOTFILES/config/shell" ~/.config/shell
	link "$DOTFILES/config/wezterm" ~/.config/wezterm
	link "$DOTFILES/config/starship.toml" ~/.config/starship.toml
	link "$DOTFILES/config/herdr" ~/.config/herdr
	link "$DOTFILES/config/nvim" ~/.config/nvim
	link "$DOTFILES/config/mise" ~/.config/mise
	link "$DOTFILES/config/bin" ~/.config/bin
	link "$DOTFILES/config/init.sh" ~/.config/init.sh
}

main
