# 🛠 Aravinth's Dotfiles

A cross-platform (WSL, macOS, Linux) developer environment powered by [chezmoi](https://www.chezmoi.io/) and compliant with the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest/ar01s03.html).

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
If WSL is already installed and you want a fresh start:

powershell
Copy
Edit
wsl --unregister Ubuntu-22.04
Then reboot your system.

2. Create a Unix User
When prompted in the Ubuntu terminal:

makefile
Copy
Edit
Username: ara-dev
Choose your preferred username.

3. Install chezmoi
Inside the Ubuntu shell:

bash
Copy
Edit
sh -c "$(curl -fsLS get.chezmoi.io)"
If chezmoi is installed to ~/bin, add to your PATH:

bash
Copy
Edit
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshenv
4. Initialize Dotfiles
bash
Copy
Edit
~/bin/chezmoi init --apply git@github.com:sptaravin-dev/dotfiles.git
If SSH isn't configured yet:

bash
Copy
Edit
~/bin/chezmoi init --apply https://github.com/sptaravin-dev/dotfiles.git
5. Set Up Git
bash
Copy
Edit
git config --global user.name "Aravinth Tamilarasan"
git config --global user.email "sptaravin.dev@gmail.com"
6. Configure SSH (Optional but Recommended)
Generate an SSH key:

bash
Copy
Edit
ssh-keygen -t ed25519 -C "sptaravin.dev@gmail.com"
Save it as:

arduino
Copy
Edit
~/.ssh/id_ed25519.sptaravin-dev.github.home
Add key to agent:

bash
Copy
Edit
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519.sptaravin-dev.github.home
Create ~/.ssh/config:

ssh
Copy
Edit
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519.sptaravin-dev.github.home
    IdentitiesOnly yes
Test:

bash
Copy
Edit
ssh -T git@github.com
🧪 Reinstallation
To start from a clean WSL install:

powershell
Copy
Edit
wsl --unregister Ubuntu-22.04
wsl --install -d Ubuntu-22.04
Then follow steps 2–6 again.

🗂 ChezMoi Structure
arduino
Copy
Edit
.config/chezmoi/
├── setup.sh                  # main bootstrap script
└── scripts/
    ├── common.sh
    ├── detect_os.sh
    ├── install_fonts.sh
    ├── install_spaceship.sh
    └── install_safe_deletion.sh
Other managed files:

arduino
Copy
Edit
.config/zsh/.zshrc
.config/zsh/.zshenv
.config/git/config
.zshenv
