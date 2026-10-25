export PATH="$HOME/.config/bin:$PATH"

source ~/.config/shell/_common.sh

for f in ~/.config/shell/*.sh; do
  [[ "$f" == */_common.sh ]] && continue
  source "$f"
done
