set -euo pipefail

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
CHEZMOI_CONFIG_DIR="$XDG_CONFIG_HOME/chezmoi"

mkdir -p "$CHEZMOI_CONFIG_DIR"

# Generate chezmoi zsh completion script
chezmoi completion zsh > "$CHEZMOI_CONFIG_DIR/chezmoi-completion.zsh"

echo "chezmoi zsh completion script generated at $CHEZMOI_CONFIG_DIR/chezmoi-completion.zsh"
