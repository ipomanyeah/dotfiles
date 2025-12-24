# Created by newuser for 5.9

echo '\n'
fastfetch
echo '\n'
fortune
echo '\n'

echo 'export QT_QPA_PLATFORMTHEME=qt5ct' >> ~/.profile
echo -ne '\e[5 q'

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

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

# --- Keybindings ---
# Ctrl+Arrow word movement
bindkey '\e[1;5D' backward-word
bindkey '\e[1;5C' forward-word

# Ctrl+Backspace word delete (if it sends ^H)
bindkey '^H' backward-kill-word


# Created by `pipx` on 2025-12-07 12:28:25
export PATH="$PATH:/home/dongfengpo/.local/bin"
