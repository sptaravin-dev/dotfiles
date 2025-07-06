#!/usr/bin/env bash

OS="$(uname -s)"

case "$OS" in
  Linux*)  OS_TYPE="linux" ;;
  Darwin*) OS_TYPE="macos" ;;
  *)       echo "❌ Unsupported OS: $OS" && exit 1 ;;
esac

export OS_TYPE
