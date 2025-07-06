#!/bin/bash
set -euo pipefail

TRASH_BIN="$HOME/.local/bin/trash"
TRASH_DIR="$HOME/.local/share/Trash/files"
INFO_DIR="$HOME/.local/share/Trash/info"

mkdir -p "$TRASH_DIR" "$INFO_DIR" "$HOME/.local/bin"

cat > "$TRASH_BIN" << 'EOFF'
#!/bin/bash
set -euo pipefail

TRASH_DIR="$HOME/.local/share/Trash/files"
INFO_DIR="$HOME/.local/share/Trash/info"
TIMESTAMP=$(date +%s)

for path in "$@"; do
  if [ ! -e "$path" ]; then
    echo "Error: '$path' not found." >&2
    continue
  fi

  filename=$(basename "$path")
  unique="${filename}_${TIMESTAMP}_$RANDOM"
  mv "$path" "$TRASH_DIR/$unique"
  echo "Path=$path" > "$INFO_DIR/$unique.trashinfo"
  echo "DeletionDate=$(date --iso-8601=seconds)" >> "$INFO_DIR/$unique.trashinfo"
done
EOFF

chmod +x "$TRASH_BIN"

echo "Installed safe-delete script to $TRASH_BIN"
