set -euo pipefail

SCRIPTS_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/chezmoi/scripts"

# shellcheck source=/dev/null
source "$SCRIPTS_DIR/common.sh"
source "$SCRIPTS_DIR/detect_os.sh"

echo "📦 Installing system packages..."
source "$SCRIPTS_DIR/install_packages.sh"

echo "🖋 Installing Fira Code Nerd Font..."
source "$SCRIPTS_DIR/install_fonts.sh"

echo "🚀 Installing Spaceship Prompt..."
source "$SCRIPTS_DIR/install_spaceship.sh"

echo "🧺 Setting up safe-delete system..."
source "$SCRIPTS_DIR/install_safe_delete.sh"

echo "✅ Setup complete."
