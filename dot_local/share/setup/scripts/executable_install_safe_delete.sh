#!/bin/bash
set -e

echo "🔐 Setting up safe-delete system..."

TRASH_DIR="$HOME/.local/share/Trash/files"
INFO_DIR="$HOME/.local/share/Trash/info"
BIN_DIR="$HOME/.local/bin"

mkdir -p "$TRASH_DIR" "$INFO_DIR" "$BIN_DIR"

# trash command
cat << 'TRASH_SCRIPT' > "$BIN_DIR/trash"
#!/bin/bash
set -e
TRASH_DIR="$HOME/.local/share/Trash/files"
INFO_DIR="$HOME/.local/share/Trash/info"
TIMESTAMP=$(date +%s)
for path in "$@"; do
  [ -e "\$path" ] || { echo "Error: '\$path' not found." >&2; continue; }
  filename=$(basename "\$path")
  unique="\${filename}_\${TIMESTAMP}_\$RANDOM"
  mv "\$path" "\$TRASH_DIR/\$unique"
  echo "\$path" > "\$INFO_DIR/\$unique.path"
done
TRASH_SCRIPT
chmod +x "$BIN_DIR/trash"

# clean-trash command
cat << 'CLEAN_SCRIPT' > "$BIN_DIR/clean-trash"
#!/bin/bash
set -e
TRASH_DIR="$HOME/.local/share/Trash/files"
INFO_DIR="$HOME/.local/share/Trash/info"
find "\$TRASH_DIR" -type f -mmin +1440 -print0 | while IFS= read -r -d '' file; do
  base=\$(basename "\$file")
  rm -f "\$file"
  rm -f "\$INFO_DIR/\${base}.path"
done
CLEAN_SCRIPT
chmod +x "$BIN_DIR/clean-trash"

echo "✅ safe-delete system ready. Files moved with 'trash' will auto-expire in 24h."
