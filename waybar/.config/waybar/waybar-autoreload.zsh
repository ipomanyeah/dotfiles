#!/usr/bin/env zsh

CONFIG_DIR="$HOME/.config/waybar"

echo "Watching $CONFIG_DIR for changes..."

inotifywait -m -e modify,create,delete,move "$CONFIG_DIR" | while read -r path event file; do
    echo "Change detected: $file ($event). Reloading Waybar..."
    /usr/bin/pkill -SIGUSR2 waybar
done
