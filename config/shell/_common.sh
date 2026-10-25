msg() {
  local _color="$1" _icon="$2" _name="$3" _text="$4"
  printf "\033[1m%b[%s %s]\033[0m ▶ %s\n" "$_color" "$_icon" "$_name" "$_text"
}

info() {
  local _icon="${1:-🐬}" _name="$2" _text="$3"
  msg $'\033[34m' "${_icon}" "${_name}" "${_text}"
}

warn() {
  local _icon="${1:-🐡}" _name="$2" _text="$3"
  msg $'\033[33m' "${_icon}" "${_name}" "${_text}"
}

error() {
  local _icon="${1:-🐙}" _name="$2" _text="$3"
  msg $'\033[31m' "${_icon}" "${_name}" "${_text}"
}
