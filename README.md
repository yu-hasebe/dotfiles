# dotfiles

Personal dotfiles for macOS.

## Setup

```sh
./install.sh
```

Creates symlinks from `~/.config/` to `config/` in this repo.

Then add the following to `~/.zshrc`:

```sh
source ~/.config/init.sh
```

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
