#!/usr/bin/env bash

if [[ "$OS_TYPE" == "linux" ]]; then
  echo "📦 Installing Linux packages..."
  sudo apt update
  sudo apt install -y unzip zsh git curl wget fontconfig
elif [[ "$OS_TYPE" == "macos" ]]; then
  echo "🍺 Installing macOS packages..."
  if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  brew install unzip zsh git curl wget fontconfig
fi
