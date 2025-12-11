#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/wallpapers/"

# Get a random wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.webp" \) | shuf -n 1)

# Apply the selected wallpaper to all monitors
hyprctl hyprpaper wallpaper ",$WALLPAPER"
