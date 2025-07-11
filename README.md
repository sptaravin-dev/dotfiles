
# 🛠 Aravinth's Dotfiles

A cross-platform (WSL, macOS, Linux) developer environment powered by [chezmoi](https://www.chezmoi.io/) and compliant with the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest/).

---

## 📦 Features

- 🔧 Shell: Zsh with Spaceship Prompt
- 🎨 Font: FiraCode Nerd Font Mono
- 🗃 XDG Directory Structure
- 💣 Safe-delete system (trash for 24h)
- 🚀 Bootstrap with a single script

---

## 🚀 First-Time Setup (WSL, MacOS)

### 1. Install Prereqs

FOR WINDOWS: Open **PowerShell as Administrator** and run:

```powershell
wsl --install -d Ubuntu-22.04
```

> If WSL is already installed and you want a fresh start:
>
> ```powershell
> wsl --unregister Ubuntu-22.04
> ```

FOR MACOS: Open **Iterm with sudo** and run:
```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then reboot your system.

---

### 2. Create a Unix User

When prompted in the Ubuntu terminal:

```
Username: ara-dev
```

Choose your preferred username.

---

### 3. Initialize Dotfiles

Execute the following command:

```bash
export GITHUB_USERNAME=sptaravin-dev
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```

After initializing chezmoi, set the Git remote URL explicitly:

```bash
cz cd
git remote set-url origin git@github.com:sptaravin-dev/dotfiles.git
```
---

