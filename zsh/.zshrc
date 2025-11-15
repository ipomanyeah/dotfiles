# Created by newuser for 5.9

fastfetch
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
export PATH=$PATH:/home/hp/.local/bin
export EDITOR=nvim
eval "$(oh-my-posh init zsh)"
