#!/usr/bin/env bash

SPACESHIP_DIR="$ZSH_CONFIG_DIR/spaceship"

mkdir -p "$ZSH_CONFIG_DIR"

if [[ ! -d "$SPACESHIP_DIR" ]]; then
  echo "🚀 Cloning Spaceship Prompt to $SPACESHIP_DIR..."
  git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$SPACESHIP_DIR"
else
  echo "✅ Spaceship Prompt already installed."
fi
