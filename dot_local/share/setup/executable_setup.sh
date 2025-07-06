set -euo pipefail

LOGFILE="$HOME/.local/share/setup/install.log"
mkdir -p "$(dirname "$LOGFILE")"

exec > >(awk '{ print strftime("[%Y-%m-%d %H:%M:%S]"), $0; fflush(); }' | tee -a "$LOGFILE") 2>&1

echo "=== Setup started at $(date) ==="

SCRIPTS_DIR="$HOME/.local/share/setup/scripts"

# shellcheck source=/dev/null
source "$SCRIPTS_DIR/common.sh"
source "$SCRIPTS_DIR/detect_os.sh"

echo "✅ Generated chezmoi zsh completion"
source "$SCRIPTS_DIR/install_chezmoi_completion.sh"

echo "📦 Installing system packages..."
source "$SCRIPTS_DIR/install_packages.sh"

echo "🖋 Installing Fira Code Nerd Font..."
source "$SCRIPTS_DIR/install_fonts.sh"

echo "🚀 Installing Spaceship Prompt..."
source "$SCRIPTS_DIR/install_spaceship.sh"

echo "🧺 Setting up safe-delete system..."
source "$SCRIPTS_DIR/install_safe_deletion.sh"

echo "✅ Setup complete."
