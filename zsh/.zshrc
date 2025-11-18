# Created by newuser for 5.9

echo '\n'
fastfetch
echo '\n'
fortune
echo '\n'

echo 'export QT_QPA_PLATFORMTHEME=qt5ct' >> ~/.profile

# --- Function to run yazi and change directory if needed ---
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# --- Environment ---
export PATH=$PATH:/home/hp/.local/bin
export PATH="$PATH:/home/hp/cp/"
export PATH=$PATH:$(go env GOPATH)/bin
export PATH="$PATH:$HOME/.spicetify"
export EDITOR=nvim

# --- Oh My Posh init ---
eval "$(oh-my-posh init zsh)"

# --- Keybindings ---
# Ctrl+Arrow word movement
bindkey '\e[1;5D' backward-word
bindkey '\e[1;5C' forward-word

# Ctrl+Backspace word delete (if it sends ^H)
bindkey '^H' backward-kill-word

