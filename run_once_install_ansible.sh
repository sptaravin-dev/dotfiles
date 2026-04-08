#!/bin/bash

is_devcontainer() {
  # You can customize this logic as needed
  if [ "$DEVCONTAINER" = "true" ] || [ -n "$CODESPACES" ]; then
    return 0
  elif grep -q 'vscode' /etc/passwd 2>/dev/null && [ -d /workspaces ]; then
    return 0
  elif grep -qi 'devcontainer' /etc/hostname 2>/dev/null; then
    return 0
  fi
  return 1
}

install_on_ubuntu() {
  sudo apt-get update
  sudo apt-get install -y ansible
  ansible-galaxy install juju4.gpgkey_generate
  if is_devcontainer; then
    echo "Detected DevContainer: running setup-devcontainer.yml"
    ansible-playbook ~/.bootstrap/setup-devcontainer.yml --ask-become-pass -vv
  else
    echo "Running setup-debian.yml"
    ansible-playbook ~/.bootstrap/setup-debian.yml --ask-become-pass -vv
  fi
}

install_on_mac() {
#  brew install ansible
#  ansible-galaxy install juju4.gpgkey_generate
#  ansible-playbook ~/.bootstrap/setup-macos.yml --ask-become-pass -vv
}

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
