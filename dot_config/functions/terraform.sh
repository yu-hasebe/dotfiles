export TENV_AUTO_INSTALL=true
alias t='terraform'
alias tui='tftui'

# tnm <name> creates a new Terraform module directory with empty main.tf, variables.tf, outputs.tf.
tnm() {
	local _dir="$1"
	if [[ -z "$_dir" ]]; then
		_msg 🦉 tnm "usage: tnm <directory>"
		return 1
	fi

	mkdir -p "$_dir"
	touch "$_dir/main.tf" "$_dir/variables.tf" "$_dir/outputs.tf"
	_msg 🦉 tnm "created $_dir/{main.tf,variables.tf,outputs.tf}"
}
