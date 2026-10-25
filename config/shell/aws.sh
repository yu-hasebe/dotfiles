# AWS Profile Switcher
awsp() {
  local _name="awsp" _icon="🐬"
  local profiles=($(aws configure list-profiles 2>/dev/null))
  if [ ${#profiles[@]} -eq 0 ]; then
    error "${_icon}" "${_name}" "No AWS profiles found."
    return 1
  fi

  info "${_icon}" "${_name}" "Select AWS Profile:"
  PS3="$(info "${_icon}" "${_name}" "Enter number: ")"
  select p in "${profiles[@]}"; do
    if [ -n "$p" ]; then
      export AWS_PROFILE="$p"
      info "${_icon}" "${_name}" "Switched to AWS_PROFILE=$AWS_PROFILE"
      break
    else
      error "${_icon}" "${_name}" "Invalid selection."
    fi
  done
}
