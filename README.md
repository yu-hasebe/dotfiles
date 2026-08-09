# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Tools

| Tool | Role |
|---|---|
| [WezTerm](https://wezfurlong.org/wezterm/) | Terminal emulator |
| [Neovim](https://neovim.io/) | Editor |
| [Starship](https://starship.rs/) | Prompt |
| [Homebrew](https://brew.sh/) | Package manager (packages listed in `Brewfile`) |

## Color scheme

**GoldenSun** — a custom dark theme shared across WezTerm and Neovim via chezmoi templates.

## Setup

Install [Homebrew](https://brew.sh/), then:

```sh
# Install Homebrew packages
brew bundle install --file Brewfile

# Install dotfiles
chezmoi init --apply yu-hasebe
```

## Update Brewfile

```sh
brew bundle dump --describe --file=Brewfile --force
```
