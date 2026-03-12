#!/usr/bin/env bash

# Check if a directory path was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory_path>" >&2
    exit 1
fi

DIR="$1"

# Check if the directory exists
if [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' does not exist" >&2
    exit 1
fi

# Find all image files in the directory
# Add or remove extensions as needed
images=()
while IFS= read -r -d '' file; do
    images+=("$file")
done < <(find "$DIR" -maxdepth 1 -type f \( \
    -iname "*.jpg" -o \
    -iname "*.jpeg" -o \
    -iname "*.png" -o \
    -iname "*.gif" -o \
    -iname "*.bmp" -o \
    -iname "*.webp" -o \
    -iname "*.svg" \
\) -print0)

# Check if any images were found
if [ ${#images[@]} -eq 0 ]; then
    echo "Error: No image files found in '$DIR'" >&2
    exit 1
fi

# Select a random image
random_index=$((RANDOM % ${#images[@]}))
echo "${images[$random_index]}"
