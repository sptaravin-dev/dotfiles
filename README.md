
# 🛠 Aravinth's Dotfiles

A cross-platform (WSL, macOS, Linux) developer environment powered by [chezmoi](https://www.chezmoi.io/) and compliant with the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest/).

---

## 📦 Features

- 🔧 Shell: Zsh with Spaceship Prompt
- 🎨 Font: FiraCode Nerd Font Mono
- 🗃 XDG Directory Structure
- 💣 Safe-delete system (trash for 24h)
- ⚙️ Git config in XDG-compliant location
- 🚀 Bootstrap with a single script

---

## 🚀 First-Time Setup on WSL (Ubuntu 22.04)

### 1. Install WSL with Ubuntu 22.04

Open **PowerShell as Administrator** and run:

```powershell
wsl --install -d Ubuntu-22.04
```

> If WSL is already installed and you want a fresh start:
>
> ```powershell
> wsl --unregister Ubuntu-22.04
> ```

Then reboot your system.

---

### 2. Create a Unix User

When prompted in the Ubuntu terminal:

```
Username: ara-dev
```

Choose your preferred username.

---

### 3. Install chezmoi

Inside the Ubuntu shell:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```

If chezmoi is installed to `~/bin`, add it to your path:

```bash
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshenv
```

---

### 4. Initialize Dotfiles

With SSH:

```bash
~/bin/chezmoi init --apply git@github.com:sptaravin-dev/dotfiles.git
```

If SSH isn't set up yet:

```bash
~/bin/chezmoi init --apply https://github.com/sptaravin-dev/dotfiles.git
```

After initializing chezmoi, set the Git remote URL explicitly:

```bash
cz cd
git remote set-url origin git@github.com:sptaravin-dev/dotfiles.git
```

---

### 5. Run Set up script

```bash
~/.local/share/setup/setup.sh
```

---

### 6. Configure SSH (Optional but Recommended)

Generate an SSH key:

```bash
ssh-keygen -t ed25519 -C "sptaravin.dev@gmail.com" -f ~/.ssh/id_ed25519.sptaravin-dev.github.home
```

Add the key to your agent:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519.sptaravin-dev.github.home
```

Create `~/.ssh/config`:

```bash
cat <<EOF > ~/.ssh/config
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519.sptaravin-dev.github.home
    IdentitiesOnly yes
EOF
```

Test the connection:

```bash
ssh -T git@github.com
```

---

## 🧪 Reinstallation

To start from a clean WSL install:

```powershell
wsl --unregister Ubuntu-22.04
wsl --install -d Ubuntu-22.04
```

Then follow steps 2–6 again.

---

## 🗂 ChezMoi Structure

```text
.config/chezmoi/
├── setup.sh                  # main bootstrap script
└── scripts/
    ├── common.sh
    ├── detect_os.sh
    ├── install_fonts.sh
    ├── install_spaceship.sh
    └── install_safe_deletion.sh
```

Other managed files:

```text
.config/zsh/.zshrc
.config/zsh/.zshenv
.config/git/config
.zshenv
```
