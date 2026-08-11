#!/usr/bin/env bash

export PATH="$HOME/.local/bin:$PATH"

source "$HOME/.config/functions/_common.sh"
for _f in "$HOME/.config/functions"/[^_]*.sh; do
  source "$_f"
done
unset _f

_shell=$(ps -p $$ -ocomm= | tr -d '-')
eval "$(starship init "$_shell")"
eval "$(direnv hook "$_shell")"
unset _shell

export TENV_AUTO_INSTALL=true
alias t='terraform'
alias k='kubectl'
