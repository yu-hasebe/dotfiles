# AWS Profile Switcher
awsp() {
	local profiles=($(aws configure list-profiles 2>/dev/null))
	if [ ${#profiles[@]} -eq 0 ]; then
		echo "No AWS profiles found."
		return 1
	fi

	echo "Select AWS Profile:"
	PS3="Enter number: "
	select p in "${profiles[@]}"; do
		if [ -n "$p" ]; then
			export AWS_PROFILE="$p"
			echo "Switched to AWS_PROFILE=$AWS_PROFILE"
			break
		else
			echo "Invalid selection."
		fi
	done
}
