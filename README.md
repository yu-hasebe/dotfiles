# dotfiles

Personal dotfiles for macOS.

## Prerequisites

- [mise](https://mise.jdx.dev/)

## Setup

```sh
mise bootstrap
```

Installs dependencies, creates symlinks under `~/.config/`, and injects `source ~/.config/init.sh` into `~/.zshrc`.

## Contents

| Path | Description |
|------|-------------|
| `config/shell/` | Shell configuration (aliases, environment, etc.) |
| `config/nvim/` | Neovim configuration |
| `config/wezterm/` | WezTerm terminal configuration |
| `config/starship.toml` | Starship prompt configuration |
| `config/mise/` | mise (tool version manager) configuration |
| `config/herdr/` | herdr configuration |
| `config/bin/` | Custom scripts (`hay`, `tnm`) |
| `config/init.sh` | Shell initialization script |

## License

[MIT](LICENSE)
