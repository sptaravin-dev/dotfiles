#!/bin/bash

install_on_ubuntu() {
  sudo apt-get update
  sudo apt-get install -y ansible
  ansible-galaxy install juju4.gpgkey_generate
  ansible-playbook ~/.bootstrap/setup-debian.yml --ask-become-pass -vv
}

install_on_mac() {
  brew install ansible
  ansible-galaxy install juju4.gpgkey_generate
  ansible-playbook ~/.bootstrap/setup-macos.yml --ask-become-pass -vv
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
