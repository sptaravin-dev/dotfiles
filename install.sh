#!/bin/bash

# -e: exit on error
# -u: exit on unset variables
set -eu

if ! chezmoi=$(command -v chezmoi); then
    bin_dir="${HOME}/.local/bin"
    chezmoi="${bin_dir}/chezmoi"
    echo "Installing chezmoi to '${chezmoi}'" >&2

    if command -v curl >/dev/null; then
        chezmoi_install_script="$(curl -fsSL get.chezmoi.io)"

    elif command -v wget >/dev/null; then
        chezmoi_install_script="$(wget -qO- get.chezmoi.io)"

    else
        echo "To install chezmoi, you must have curl or wget installed." >&2
        exit 1
    fi
    sh -c "${chezmoi_install_script}" -- -b "${bin_dir}"
    unset chezmoi_install_script bin_dir
fi

echo "Installing nvim latest"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C /usr/local/ -xzf nvim-linux64.tar.gz --strip-components=1

echo "Installing lazygit"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
