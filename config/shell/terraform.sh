export TENV_AUTO_INSTALL=true
alias t='terraform'
alias tui='tftui'

# tnm <name> creates a new Terraform module directory with empty main.tf, variables.tf, outputs.tf.
tnm() {
  local _name="tnm"
  local _dir="$1"
  if [[ -z "$_dir" ]]; then
    info "${_name}" "usage: tnm <directory>"
    return 1
  fi

  mkdir -p "$_dir"
  touch "$_dir/main.tf" "$_dir/variables.tf" "$_dir/outputs.tf"
  info "${_name}" "created $_dir/{main.tf,variables.tf,outputs.tf}"
}
