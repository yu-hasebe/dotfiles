source "${XDG_CONFIG_HOME:-$HOME/.config}/starship_switch.zsh"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
