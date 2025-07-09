#!/usr/bin/env bash
set -euo pipefail

case "${OS_TYPE:-$(uname -s)}" in
  Linux|linux)
    sudo apt update
    sudo apt install -y gnupg2 pinentry-curses
    ;;
  Darwin|macos)
    if ! command -v brew &>/dev/null; then
      echo "Homebrew not found. Please install Homebrew first."
      exit 1
    fi
    brew install gnupg pinentry-mac
    mkdir -p ~/.gnupg
    echo "use-agent" >> ~/.gnupg/gpg.conf
    echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
    gpgconf --kill gpg-agent
    ;;
  *)
    echo "Unsupported OS for GPG dependencies installation."
    exit 1
    ;;
esac

echo "🔐 Setting up GPG key and Git signing..."

KEY_EMAIL="sptaravin.dev@gmail.com"
KEY_COMMENT="GPG key for Git signing"

echo "🔐 Checking for existing GPG key..."
if ! gpg --list-secret-keys "$KEY_EMAIL" >/dev/null 2>&1; then
  echo "🔐 No existing GPG key found, creating new Ed25519 key..."

  # Ensure loopback pinentry is allowed for non-interactive keygen
  if ! grep -q 'allow-loopback-pinentry' ~/.gnupg/gpg-agent.conf 2>/dev/null; then
    echo "📝 Adding 'allow-loopback-pinentry' to ~/.gnupg/gpg-agent.conf"
    echo 'allow-loopback-pinentry' >> ~/.gnupg/gpg-agent.conf
  fi

  echo "🔄 Restarting gpg-agent..."
  gpgconf --kill gpg-agent

  # Generate the GPG key in batch mode using loopback pinentry
  cat <<EOFGPG | gpg --batch --pinentry-mode loopback --gen-key
Key-Type: eddsa
Key-Curve: ed25519
Key-Usage: sign
Name-Real: Aravinth Tamilarasan
Name-Email: $KEY_EMAIL
Expire-Date: 0
%no-protection
%commit
EOFGPG

  echo "✅ GPG key created."
else
  echo "✅ Existing GPG key found."
fi

# Extract the key ID for configuration
KEY_ID=$(gpg --list-secret-keys --with-colons "$KEY_EMAIL" | awk -F: '/^sec/{print $5; exit}')
echo "🔑 Using GPG Key ID: $KEY_ID"

# Update chezmoi config with the GPG key ID
CHEZMOI_DATA="${XDG_CONFIG_HOME:-$HOME/.config}/chezmoi/chezmoi.toml"
if grep -q '^gpgKeyID' "$CHEZMOI_DATA"; then
  sed -i "s/^gpgKeyID = .*/gpgKeyID = \"$KEY_ID\"/" "$CHEZMOI_DATA"
else
  echo "gpgKeyID = \"$KEY_ID\"" >> "$CHEZMOI_DATA"
fi

# Configure Git to use this GPG key for signing commits
git config --global user.signingkey "$KEY_ID"
git config --global commit.gpgsign true

echo "✅ Git configured to sign commits with GPG key."
