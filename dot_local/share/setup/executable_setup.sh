#!/bin/bash

set -euo pipefail

export PATH="$HOME/bin:$PATH"

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

echo "📂 Installing eza..."
source "$SCRIPTS_DIR/install_eza.sh"

echo "🛠 Installing LazyGit..."
source "$SCRIPTS_DIR/install_lazygit.sh"

echo "🔐 Installing and configuring GPG key..."
source "$SCRIPTS_DIR/install_gpg.sh"

# Set Zsh as default shell
echo "🐚 Configuring zsh as default shell..."

if grep -qi microsoft /proc/version; then
  echo "⚠️  WSL detected: Adding fallback zsh exec to ~/.bashrc..."
  if ! grep -q "exec zsh" "$HOME/.bashrc"; then
    echo -e "
# Launch zsh automatically in WSL
if [ -t 1 ]; then
  exec zsh
fi" >> "$HOME/.bashrc"
    echo "✅ Added zsh launch fallback to ~/.bashrc"
  fi
else
  ZSH_PATH=$(command -v zsh)
  if ! grep -q "$ZSH_PATH" /etc/shells; then
    echo "$ZSH_PATH" | sudo tee -a /etc/shells
  fi
  chsh -s "$ZSH_PATH"
  echo "✅ Default shell changed to zsh"
fi

echo "✅ Setup complete."
