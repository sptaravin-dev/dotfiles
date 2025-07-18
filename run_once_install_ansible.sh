#!/bin/bash
set -euo pipefail

install_on_ubuntu() {
  sudo apt-get update
  sudo apt-get install -y ansible
  ansible-playbook ~/.bootstrap/setup-debian.yml --ask-become-pass -vv
}

install_on_mac() {
  brew install ansible
  ansible-playbook ~/.bootstrap/setup-macos.yml --ask-become-pass -vv
}

install_on_devcontainer() {
  sudo apt-get update
  sudo apt-get install -y ansible
  ansible-playbook ~/.bootstrap/setup-devcontainer.yml --ask-become-pass -vv
}

if [ -f "/.devcontainer.json" ] || [ "$DEVCONTAINER" = "true" ]; then
  echo "Installing inside a DevContainer"

  if grep -qi ubuntu /etc/os-release; then
    echo "Confirmed: Ubuntu-based DevContainer"
    install_on_devcontainer
    echo "Ansible installation complete."
    exit 0
  else
    echo "Non-Ubuntu DevContainer detected. Aborting."
    exit 1
  fi
else
  OS="$(uname -s)"
  case "${OS}" in
  Linux*)
    if [ -f /etc/lsb-release ]; then
      install_on_ubuntu
    else
      echo "Unsupported Linux distribution"
      exit 1
    fi
    ;;
  Darwin*)
    install_on_mac
    ;;
  *)
    echo "Unsupported operating system: ${OS}"
    exit 1
    ;;
  esac

  echo "Ansible installation complete."
fi
