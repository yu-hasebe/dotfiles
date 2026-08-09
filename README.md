# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Tools

| Tool | Role |
|---|---|
| [WezTerm](https://wezfurlong.org/wezterm/) | Terminal emulator |
| [Neovim](https://neovim.io/) | Editor |
| [Starship](https://starship.rs/) | Prompt |
| [Homebrew](https://brew.sh/) | Package manager (packages listed in `Brewfile`) |
| [herdr](https://herdr.io/) | Terminal task manager |

## herdr

`~/.config/herdr/config.toml` configures herdr to blend with the terminal's own color scheme:

- `theme.name = "terminal"` — uses terminal colors instead of herdr's built-in palette
- `theme.custom.panel_bg = "reset"` — transparent panel background
- `ui.accent = "bright-black"` — accent color mapped to the terminal's bright-black

## Color scheme

**GoldenSun** — a custom dark theme shared across WezTerm and Neovim via chezmoi templates.

## Design

`~/.zshrc` itself is not Git-managed, as tools often append to it automatically. Instead, all shell initialization lives in a single entry point managed here:

```
~/.config/init.sh
```

`~/.zshrc` only needs one line:

```sh
source "${XDG_CONFIG_HOME:-$HOME/.config}/init.sh"
```

`init.sh` handles:
- Starship prompt initialization
- direnv hook initialization
- Starship theme switching (`warrior` / `mage` / `rogue` / `archer` commands)

Starship themes are managed under `~/.config/starship/`. Switching a theme persists to `~/.config/starship/theme` and is restored on next shell startup.

## Setup

Install [Homebrew](https://brew.sh/), then:

```sh
# Install Homebrew packages
brew bundle install --file Brewfile

# Install dotfiles
chezmoi init --apply yu-hasebe
```

Add to `~/.zshrc`:

```sh
source "${XDG_CONFIG_HOME:-$HOME/.config}/init.sh"
```

## Update Brewfile

```sh
brew bundle dump --describe --file=Brewfile --force
```
