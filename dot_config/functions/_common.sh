_msg() {
	local _icon="$1" _name="$2" _text="$3"
	printf "\033[1m[%s %s]\033[0m ▶ %s\n" "$_icon" "$_name" "$_text"
}
