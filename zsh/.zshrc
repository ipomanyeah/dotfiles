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
export TERMINAL=kitty
export EDITOR=nvim

# --- Keybindings ---
# Ctrl+Arrow word movement
bindkey '\e[1;5D' backward-word
bindkey '\e[1;5C' forward-word

# Ctrl+Backspace word delete (if it sends ^H)
bindkey '^H' backward-kill-word

# BUILD SCRIPT FOR COMPETITVE PROGRAMMING
build() {
  if [[ $# -lt 1 ]]; then
    echo "Usage:"
    echo "  build <file.cpp>"
    echo "  build <file.cpp> <input.txt>"
    echo "  build <file.cpp> <input.txt> <output.txt>"
    echo "  build <file.cpp> --only"
    return 1
  fi

  local src="$1"
  local base="${src%.cpp}"
  local exe="./$base"

  if [[ ! -f "$src" ]]; then
    echo "Error: $src not found"
    return 1
  fi

  local start=$SECONDS

  echo "▶ Compiling $src ..."

  clang++ \
    -Wall \
    -g \
    -march=native \
    -std=c++20 \
    -pipe \
    -fuse-ld=lld \
    "$src" -o "$base"

  local ret=$?
  local elapsed=$((SECONDS - start))

  if [[ $ret -ne 0 ]]; then
    echo "✖ Compilation failed (${elapsed}s)"
    return 1
  fi

  echo "✔ Compilation finished in ${elapsed}s → $exe"
  echo -ne "\a"   # terminal bell

  # compile only
  if [[ "$2" == "--only" ]]; then
    return 0
  fi

  # run
  if [[ $# -eq 1 ]]; then
    $exe
  elif [[ $# -eq 2 ]]; then
    $exe < "$2"
  else
    $exe < "$2" > "$3"
  fi
}

# Created by `pipx` on 2025-12-07 12:28:25
export PATH="$PATH:/home/dongfengpo/.local/bin"

