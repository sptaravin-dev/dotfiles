#!/bin/sh

set -e

# Download and install FiraCode Nerd Font Mono
echo "Installing FiraCode Nerd Font Mono..."

FONT_NAME="FiraCode"
FONT_VARIANT="FiraCodeNerdFontMono"
ZIP_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT_NAME}.zip"

TMP_DIR="$(mktemp -d)"
FONT_DIR="${HOME}/.local/share/fonts"

mkdir -p "$FONT_DIR"

curl -Lo "$TMP_DIR/$FONT_NAME.zip" "$ZIP_URL"
unzip -o "$TMP_DIR/$FONT_NAME.zip" -d "$TMP_DIR"

# Install only the Mono variant fonts
find "$TMP_DIR" -type f -iname "*Mono.ttf" -exec cp {} "$FONT_DIR" \;

# Clean up
rm -rf "$TMP_DIR"

# Refresh font cache (Linux only)
if command -v fc-cache >/dev/null 2>&1; then
    echo "Updating font cache..."
    fc-cache -fv "$FONT_DIR"
fi

echo "✅ FiraCode Nerd Font Mono installed."
