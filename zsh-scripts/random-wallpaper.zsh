#!/usr/bin/env zsh

DIR="$HOME/Pictures/wallpapers"

while true; do
  FILE=($DIR/**/*.(jpg|jpeg|png|webp|gif)(.N))
  IMG="${FILE[RANDOM % ${#FILE[@]} + 1]}"

  awww img "$IMG" \
    --transition-type=random \
    --transition-duration=1.2 \
    --transition-fps=144

  sleep 900   # 15 minutes
done
