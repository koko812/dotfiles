#!/usr/bin/env bash
set -e

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"

echo "[info] DOTFILES_DIR = $DOTFILES_DIR"

# ----- oh-my-zsh -----
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "[info] Installing oh-my-zsh..."
  ZSH="$HOME/.oh-my-zsh" RUNZSH=no CHSH=no \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "[info] oh-my-zsh already installed. skip."
fi

# ----- zsh plugins (autosuggestions, syntax highlighting) -----
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "[info] Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
  echo "[info] zsh-autosuggestions already installed. skip."
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  echo "[info] Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
  echo "[info] zsh-syntax-highlighting already installed. skip."
fi


# ----- fzf -----
if [ ! -d "$HOME/.fzf" ]; then
  echo "[info] Installing fzf..."
  git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
  "$HOME/.fzf/install" --key-bindings --completion --no-update-rc
else
  echo "[info] fzf already installed. skip."
fi

# ----- zoxide -----
if ! command -v zoxide >/dev/null 2>&1; then
  echo "[info] Installing zoxide..."
  curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
else
  echo "[info] zoxide already installed. skip."
fi

# ----- gh (GitHub CLI) -----
if ! command -v gh >/dev/null 2>&1; then
  echo "[info] Installing gh (user-local)..."
  GH_VER="2.63.0"
  curl -L \
    https://github.com/cli/cli/releases/download/v${GH_VER}/gh_${GH_VER}_linux_amd64.tar.gz \
    -o /tmp/gh.tar.gz

  tar -xzf /tmp/gh.tar.gz -C /tmp
  mkdir -p "$HOME/.local/bin"
  mv /tmp/gh_${GH_VER}_linux_amd64/bin/gh "$HOME/.local/bin/"
  echo "[info] gh installed to ~/.local/bin/gh"
else
  echo "[info] gh already installed. skip."
fi

# ----- uv -----
if ! command -v uv >/dev/null 2>&1; then
  echo "[info] Installing uv (user-local)..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
  echo "[info] uv installed. Make sure ~/.local/bin or ~/.cargo/bin is on PATH."
else
  echo "[info] uv already installed. skip."
fi



# ----- ~/.zshrc を dotfiles 版に差し替え -----
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
  echo "[warn] $HOME/.zshrc が既に存在するのでバックアップします..."
  mv "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y%m%d%H%M%S)"
fi

ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
echo "[ok] ~/.zshrc -> $DOTFILES_DIR/zsh/.zshrc"

echo "[done] 反映するには 'exec zsh' か 'zsh' を実行してください。"

