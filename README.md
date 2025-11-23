# dotfiles

Environment setup for zsh, tmux, vim, and custom commands.  
This repository provides a minimal and portable setup for local machines, Docker containers, and HPC environments.

---

## 📦 Installation

### 1. Clone this repository

```bash
git clone https://github.com/koko812/dotfiles.git ~/dotfiles

---

## 🛠 deploy (dotfiles setup)

Deploys `.zshrc`, `.vimrc`, `.tmux.conf`, and creates symlinks.
Existing files are safely backed up.

```bash
bash ~/dotfiles/scripts/deploy_dotfiles.sh
```

This step is safe to re-run at any time.

---

## 🚀 bootstrap (tool installation)

Installs shell tools (oh-my-zsh, fzf, zoxide), custom commands, and optional tools such as uv and gh.
Use this on environments where installation is possible (local, Docker, some HPC).

```bash
bash ~/dotfiles/scripts/bootstrap.sh
```

---

## 🔧 usage flow

Typical workflow:

1. **deploy** — apply dotfiles (safe to run repeatedly)
2. **bootstrap** — install tools as needed

```bash
bash ~/dotfiles/scripts/deploy_dotfiles.sh
bash ~/dotfiles/scripts/bootstrap.sh
```

---

## 📁 Structure

```
dotfiles/
  zsh/.zshrc
  vim/.vimrc
  tmux/.tmux.conf
  custom_commands/
    gacp
  scripts/
    deploy_dotfiles.sh
    bootstrap.sh
```

---

## 🧩 Custom commands

Place custom utilities in:

```
~/dotfiles/bin
```

These are automatically added to PATH during bootstrap.

---

## ⚠ Notes

* `bootstrap.sh` performs installation steps and requires an environment where downloads and compilation are allowed.
* `deploy_dotfiles.sh` only manages symlinks and is safe for HPC environments without sudo.
* No private tokens or credentials are stored in this repository.

---

## 📝 License

MIT


