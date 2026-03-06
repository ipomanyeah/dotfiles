if status is-interactive
    echo
    fastfetch
    echo
    fortune
    echo

    # --- Environment ---
    set -gx PATH $PATH /home/hp/.local/bin
    set -gx PATH $PATH /home/hp/cp/
    set -gx PATH $PATH (go env GOPATH)/bin
    set -gx PATH $PATH $HOME/.spicetify

    set -gx TERMINAL kitty
    set -gx EDITOR nvim

    # --- Keybindings ---
    # Ctrl + Arrow word movement
    bind \e\[1\;5D backward-word
    bind \e\[1\;5C forward-word

    # Ctrl + Backspace word delete (if it sends ^H)
    bind \b backward-kill-word

end
