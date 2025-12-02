# Define variables
START_PATTERN="## START-BIND SECTION"
END_PATTERN="## END-BIND-SECTION"
INPUT_FILE="/home/dongfengpo/dotfiles/hyprland/.config/hypr/hyprland.conf"

# Extract block including markers and pipe to bat
grep -Pzo "(?s)$START_PATTERN.*?$END_PATTERN" "$INPUT_FILE" | bat --paging=never

