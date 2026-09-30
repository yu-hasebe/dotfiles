fe() {
  nvim "$(fzf --preview 'bat --style=numbers --color=always {} 2>/dev/null || cat {}')"
}
fcd() {
  cd "$(find . -type d 2>/dev/null | fzf)" || exit
}
fh() {
  local cmd
  cmd=$(history | fzf --tac --no-sort | sed 's/ *[0-9]* *//') && eval "$cmd"
}
